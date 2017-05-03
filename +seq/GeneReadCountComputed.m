%{
# Number of reads mapping to each gene for each sample, computed within datajoint using read alignments and annotaitons
->seq.GeneReadCount
---
comp_gene_read_count :int unsigned       # total number of reads mapped to this gene for each sample using the specificed annotation database

%}

classdef GeneReadCountComputed < dj.Computed  
           
    methods(Access=protected)
        
        function makeTuples(self, key)
            %error 'this table is populated in python'
            %self.insert(key)
        end
    end
 
end