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

classdef Alignment < dj.Imported
    properties(Constant)
        rootDataPath = '/Users/cathryn/Dropbox/Microcolumn\ Patch-seq data'
    end
    
    properties
        keySource = seq.Lane*seq.AlignmentInfo & seq.Read
    end
           
    methods(Access=protected)
        
        function makeTuples(self, key)
            disp(key)
        end
    end

end