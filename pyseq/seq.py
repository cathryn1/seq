import datajoint as dj
import gzip
import glob
import os
from datetime import datetime
import itertools
import random
schema = dj.schema('seq_seq', locals())


@schema
class SequencingPrimers(dj.Lookup):
    definition = """
    primers : varchar(30)  # primers used for sequencing, e.g. Nextera s7+i5
    """
    contents = [
        ['Nextera s7+i5']
    ]


@schema
class Pool(dj.Manual):
    definition = """   # information about each pool of cDNA sent for sequencing
    pool_id : varchar(20)  # unique id for each pool
    -----
    size=null: tinyint unsigned # mean size of pooled cDNA sent for sequencing (in bp)
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
    flow_cell='' : varchar(255)  # flowcell used on this run
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
        key['flow_cell'] = parts[6].split('.')[0]
        self.insert1(key)


@schema
class Read(dj.Imported):
    definition = """
    -> Lane
    read_id                     : char(16)                  # machine-assigned id
    ---
    read_seq                    : varchar(100)                  # sequence of actual read
    read_qc                     : varchar(100)                  # quality control measure for the read sequence
    index1_seq                : varchar(50)                   # sequence of the index
    index1_qc                  : varchar(100)                  # quality control measure for the index sequence
    index2_seq=''                : varchar(50)                   # sequence of the index
    index2_qc=''                 : varchar(100)                  # quality control measure for the index sequence
    """

    def _make_tuples(self, key):

        def form_iter(it):
            """
            :param it: iterator of reads
            :return: yields dicts to insert
            """
            for rec in it:
                ids = rec[0]
                seq = rec[1]
                qc = rec[3]
                yield dict(key,
                           read_id='_'.join(ids[0].split('_')[4:6]).strip(),
                           read_seq=seq[0].strip(),
                           read_qc=qc[0].strip(),
                           index1_seq=seq[1].strip(),
                           index1_qc=qc[1].strip(),
                           index2_seq='' if len(seq) < 3 else seq[2].strip(),
                           index2_qc='' if len(qc) < 3 else qc[2].strip())

        file_mask = (Run() & key).fetch1['file_pattern']
        file_mask = file_mask.format(run=key['run_id'], lane=key['lane'])
        filenames = glob.glob(file_mask)
        assert len(filenames) in [2, 3]
        if not filenames:
            raise Exception('Did not find any matching files for the run')
        fids = [gzip.open(name, 'rt') for name in sorted(filenames)]
        lines_per_record = 4
        rec_reader = zip(*([zip(*fids)]*lines_per_record))
        read_iterator = form_iter(rec_reader)
        get_chunk = lambda: list(itertools.islice(read_iterator, 4000))
        chunk = get_chunk()
        while chunk:
            print('.', end='\n' if random.random() < 0.04 else '', flush=True)
            self.insert(chunk)
            chunk = get_chunk()
        for f in fids:
            f.close()

schema.spawn_missing_classes()
