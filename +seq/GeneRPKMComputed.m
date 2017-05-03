%{
# RPKM for each gene for each sample, computed within datajoint using read counts and gene lengths
->seq.GeneReadCountComputed
---
comp_gene_rpkm :double       # total number of reads mapped to this gene for each sample using the specificed annotation database

%}

classdef GeneRPKMComputed < dj.Computed  
           
    methods(Access=protected)
        
        function makeTuples(self, key)
            %error 'this table is populated in python'
            %self.insert(key)
        end
    end
 
end