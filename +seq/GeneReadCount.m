%{
# Number of reads mapping to each gene for each sample, uploaded from STAR mapping output
->seq.PooledSample
->seq.Gene
->seq.AnnotationDatabase
---
gene_read_count     :int unsigned       # total number of reads mapped to this gene for each sample using the specificed annotation database
%}

classdef GeneReadCount < dj.Manual
end