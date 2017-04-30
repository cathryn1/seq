%{
# gene annotations
->seq.AnnotationDatabase
->seq.AssemblyUnit
ann_gene: varchar(20)   # unique id for gene annotation within the assmebly unit, i.e. from RefSeq
ann_tx:   varchar(30)     # name of transcript corresponding to annotation
tx_start: int unsigned     # transcription start site with respect to assmebly unit
---
->seq.Gene
ann_strand=null:    char(1)     # strand orientation, + or -
tx_end=null: int unsigned   # transcription end site with respect to assmebly unit
cds_start=null: int unsigned     # coding region start site with respect to assmebly unit
cds_end=null: int unsigned  # coding region end site with respect to assembly unit
cds_start_stat=null: varchar(20)    # quality of information regarding coding start site
cds_end_stat=null: varchar(20)    # quality of information regarding coding end site
exon_count=null: smallint unsigned   # number of annotated exons
%}

classdef AnnotatedGene < dj.Manual
end
