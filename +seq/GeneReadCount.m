%{
# Number of reads mapping to each gene for each sample, uploaded from STAR mapping output
->seq.Gene
->seq.PooledSample
->seq.AnnotationDatabase
---
gene_read_count     :int unsigned       # total number of reads mapped to this gene for each sample using the specificed annotation databse
%}

classdef GeneReadCount < dj.Manual
end