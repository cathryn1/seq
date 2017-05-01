import datajoint as dj
import gzip
import glob
import os
import re
import subprocess
from datetime import datetime
import itertools
from tqdm import tqdm
import seqbase64
from io import BytesIO
import urllib.parse
import ftplib


schema = dj.schema('seq_seq', locals())


@schema
class SequencingPrimers(dj.Lookup):
    definition = """
    seq_primers : varchar(30)  # primers used for sequencing, e.g. Nextera s7+i5
    """
    contents = [
        ['Nextera s7+i5']
    ]


@schema
class Pool(dj.Manual):
    definition = """   # information about each pool of cDNA sent for sequencing
    pool_id : varchar(20)  # unique id for each pool
    -----
    size=null: smallint unsigned # mean size of pooled cDNA sent for sequencing (in bp)
    conc=null: decimal(3,2) # final concentration of pooled cDNA sent for sequencing (in ng/ul)
    """


@schema
class Run(dj.Manual):
    definition = """
     # information about each sequencing run
     run_id                      : smallint unsigned             # unique id for each run
     ---
     file_pattern                : varchar(255)                  # data folder for the filede
     machine                     : varchar(25)                   # machine used for sequencing, i.e. HiSeq 2500
     """


@schema
class Lane(dj.Manual):
    definition = """
     # information about each lane within a sequencing run
     -> Run
     lane                        : tinyint unsigned              # lane number within the run (1-8)
     ---
     -> SequencingPrimers
     -> Pool
    """


@schema
class FlowCell(dj.Imported):
    definition = """
    -> Run
    ---
    flowcell='' : varchar(255)  # flowcell used on this run
    run_date : date    # run date
    """

    def _make_tuples(self, key):
        file_mask = (Run() & key).fetch1['file_pattern']
        file_mask = file_mask.format(run=key['run_id'], lane='*')
        filenames = glob.glob(file_mask)
        if not filenames:
            raise Exception('Did not find any matching files for the run')
        parts = os.path.basename(filenames[0]).split('_')
        key['run_date'] = datetime.strptime(parts[3], '%y%m%d')
        key['flowcell'] = parts[6].split('.')[0]
        self.insert1(key)


def count_lines(gzfile):
    proc = subprocess.Popen(('gunzip', '-c', gzfile), stdout=subprocess.PIPE)
    output = subprocess.check_output(('wc', '-l'), stdin=proc.stdout)
    return int(re.search(r'\d+', output.decode()).group())


@schema
class Read(dj.Imported):
    definition = """
    -> Lane
    read_id                     : int                 # sequential id
    ---
    read_seq                    : varchar(100)                  # base64 ASCII-encoded sequence of actual read
    read_qc                     : varchar(100)                  # quality control measure for the read sequence
    index1_seq                : varchar(50)                   # base64 ASCII-encoded sequence of the index
    index1_qc                  : varchar(100)                  # quality control measure for the index sequence
    index2_seq=''                : varchar(50)                   # base64 ASCII-encoded sequence of the index
    index2_qc=''                 : varchar(100)                  # quality control measure for the index sequence
    """

    def _make_tuples(self, key):

        def form_iter(it):
            """
            :param it: iterator of reads
            :return: yields dicts to insert
            """
            for i, rec in enumerate(it):
                seq = rec[1]
                qc = rec[3]
                yield dict(key,
                           read_id=i,
                           read_seq=seqbase64.encode(seq[0].strip()),
                           read_qc=qc[0].strip(),
                           index1_seq=seqbase64.encode(seq[1].strip()),
                           index1_qc=qc[1].strip(),
                           index2_seq='' if len(seq) < 3 else seqbase64.encode(seq[2].strip()),
                           index2_qc='' if len(qc) < 3 else qc[2].strip())

        file_mask = (Run() & key).fetch1['file_pattern']
        file_mask = file_mask.format(run=key['run_id'], lane=key['lane'])
        filenames = glob.glob(file_mask)
        assert len(filenames) in [2, 3]
        if not filenames:
            raise Exception('Did not find any matching files for the run')
        nreads = count_lines(filenames[0])//4
        print('Importing {nreads} reads'.format(nreads=nreads))
        fids = [gzip.open(name, 'rt') for name in sorted(filenames)]
        lines_per_record = 4
        rec_reader = zip(*([zip(*fids)]*lines_per_record))   # reads chunks of four lines from three files
        read_iterator = form_iter(rec_reader)                # formats into insertable tuples
        chunk_size = 4000
        get_chunk = lambda: list(itertools.islice(read_iterator, chunk_size))  # forms chunks of tuples
        chunk = get_chunk()
        with tqdm(total=nreads) as progress:
            while chunk:
                self.insert(chunk)
                chunk = get_chunk()
                progress.update(chunk_size)
        for f in fids:
            f.close()


@schema
class Species(dj.Lookup):
    definition = """
    # Source of genetic material
    species              : varchar(20)                  # short name of species
    ---
    species_name         : varchar(100)                 # long name of species
    """


@schema
class Genome(dj.Lookup):
    definition = """
    # genome assembly used for alignment
    assembly             : varchar(20)                  # short name of genome assembly
    ---
    -> Species
    source_location=""   : varchar(255)                 # a file or ftp or
    """


@schema
class AssemblyUnit(dj.Imported):
    definition = """
    -> Genome
    assembly_unit        : varchar(40)                  # short name of assembly unit
    ---
    assembly_seq=null    : longblob                     # full sequence of assembly unit, if known
    """

    @property
    def key_source(self):
        return Genome() & 'source_location > ""'

    def _make_tuples(self, key):
        source = urllib.parse.urlparse((Genome() & key).fetch1['source_location'])
        ftp = ftplib.FTP(source.netloc)
        ftp.login()
        ftp.cwd(source.path)
        print(source.path)
        for name in tqdm(sorted(ftp.nlst('chr*.fa.gz'))):
            sio = BytesIO()
            ftp.retrbinary('RETR %s' % name, sio.write)
            lines = gzip.decompress(sio.getvalue()).decode().split('\n')
            sio.close()
            self.insert1(dict(key, assembly_unit=lines[0][1:], assembly_seq=''.join(lines[2:])))

schema.spawn_missing_classes()
