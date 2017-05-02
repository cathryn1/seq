%{
# RPKM for each gene for each sample, uploaded from STAR mapping output
->seq.GeneReadCount
---
gene_rpkm     :double       # rpkm for each gene and sample using the specificed annotation database
%}

classdef GeneRPKM < dj.Manual
end