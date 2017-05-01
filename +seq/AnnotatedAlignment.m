%{
# Information about each alignment (import from .bam file)
->seq.Alignment
->seq.AnnotationDatabase
---
->seq.AnnotatedGene

align_flag=null:  int unsigned    # flag 
align_mapq=null:    int unsigned    # Mmap quality 
align_cigar=null:   varchar(100)    # CIGAR strign
align_nh=null:  int unsigned    # number of hits 
align_hi=null:  int unsigned    # hit index 
align_as=null:  tinyint unsigned   # alignment score 
align_nm=null: tinyint unsigned     # number of mismatches 
%}

classdef AnnotatedAlignment < dj.Computed
end