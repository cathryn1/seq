%{
# Information about each alignment (import from .bam file)
->seq.AlignmentInfo
->seq.Read
align_hi:  int unsigned    # hit index
---
->seq.AssemblyUnit
align_pos=null: int unsigned  # 1-based leftmost mapping position within assmebly unit
align_flag=null:  int unsigned    # flag
align_mapq=null:    int unsigned    # Mmap quality
align_cigar=null:   varchar(100)    # CIGAR strign
align_nh=null:  int unsigned    # number of hits
align_as=null:  tinyint unsigned   # alignment score
align_nm=null: tinyint unsigned     # number of mismatches
%}

classdef Alignment2 < dj.Imported
    properties(Constant)
        rootDataPath = '/home/dimitri/dev/seq/data/'
    end
    
    properties
        keySource = seq.Lane*seq.AlignmentInfo & seq.Read
    end
    
    methods(Access=protected)
        
        function makeTuples(self, key)
            f = fullfile(self.rootDataPath, fetch1(seq.AlignmentInfo & key, 'folder_name'));
            chrom = fetchn(seq.AssemblyUnit & (seq.AlignmentInfo & key), 'assembly_unit');
            assembly = fetch1(seq.AlignmentInfo & key, 'assembly');
            files = dir(fullfile(f, '*/*.bam'));
            if isempty(files)
                disp 'no files found'
            end
            chunk_size = 2000;
            tuples = [];
            for f = files'
                disp(f.name)
                info = baminfo(fullfile(f.folder, f.name));
                for d = info.SequenceDictionary
                    if ismember(d.SequenceName, chrom)
                        for bam = bamread(fullfile(f.folder, f.name), d.SequenceName,[ 1 d.SequenceLength])'
                            tuple = key;
                            readID = strsplit(bam.QueryName, ':');
                            tuple.read_id = strjoin(readID(4:7), ':');
                            tag = bam.Tags;
                            tuple.align_hi = tag.HI;
                            tuple.assembly = assembly;
                            tuple.assembly_unit = d.SequenceName;
                            tuple.align_pos = bam.Position;
                            tuple.align_flag = bam.Flag;
                            tuple.align_mapq = bam.MappingQuality;
                            tuple.align_cigar = bam.CigarString;
                            tuple.align_nh = tag.NH;
                            tuple.align_as = tag.AS;
                            tuple.align_nm = tag.nM;
                            tuples = [tuples; tuple]; %#ok<AGROW>
                            if length(tuples)>chunk_size
                                self.insert(tuples)
                                tuples = [];
                            end
                        end
                    end
                end
            end
            if ~isempty(tuples)
                self.insert(tuples)
            end
        end
    end
end