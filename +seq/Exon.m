%{
# exon locations within annotated genes
->seq.AnnotatedGene
exon:   varchar(30)     # name/number of exon from annotation database
---
exon_start=null: int unsigned    #exon start location within assembly unit
exon_end=null:   int unsigned    #exon end location within assembly unit
exon_frame=null: tinyint    # exon frame (i.e. 0,1,2) or -1 if no frame for exon
%}

classdef Exon < dj.Manual
end