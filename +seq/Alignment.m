%{
# Information about each alignment (import from .bam file)
->seq.AlignmentInfo
->seq.Read
->seq.AssemblyUnit
align_hi:  int unsigned    # hit index 
---
align_pos=null: int unsigned  # 1-based leftmost mapping position within assmebly unit
align_flag=null:  int unsigned    # flag 
align_mapq=null:    int unsigned    # Mmap quality 
align_cigar=null:   varchar(100)    # CIGAR strign
align_nh=null:  int unsigned    # number of hits 
align_as=null:  tinyint unsigned   # alignment score 
align_nm=null: tinyint unsigned     # number of mismatches 
%}

classdef Alignment < dj.Manual
end