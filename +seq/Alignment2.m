%{
# Information about each alignment (import from .bam file)
->seq.Read
->seq.AlignmentInfo
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
        rootDataPath = '/Users/dimitri/Dropbox/Microcolumn Patch-seq data'
    end
    
    properties
        keySource = seq.Lane*seq.AlignmentInfo & seq.Read
    end
    
    methods(Access=protected)
        
        function makeTuples(self, key)
            f = fullfile(self.rootDataPath, fetch1(seq.AlignmentInfo & key, 'folder_name'));
            chrom = fetchn(seq.AssemblyUnit & (seq.AlignmentInfo & key), 'assembly_unit');
            assembly = fetch1(seq.AlignmentInfo & key, 'assembly');
            
            files = dir(fullfile(f, '*.bam'));
            for f = files(:)'
                info = baminfo(fullfile(f.folder, f.name));
                hbar = waitbar(0, sprintf('reading %s..', f.name));
                ndicts = length(info.SequenceDictionary);
                for j = 1:ndicts
                    d = info.SequenceDictionary(j);
                    if ismember(d.SequenceName, chrom)
                        tuples = [];
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
                        end
                        self.insert(tuples)
                    end
                    waitbar(j/ndicts)
                end
                close(hbar)
            end
        end
    end    
end