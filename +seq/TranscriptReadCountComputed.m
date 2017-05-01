%{
# Number of reads mapping to each transcript for each sample, computed within datajoint using read alignment and annotations 
->seq.PooledSample
->seq.AnnotatedGene
---
comp_tx_read_count :int unsigned       # total number of reads mapped to this transcript for each sample using the specificed annotation database
%}

classdef TranscriptReadCountComputed < dj.Computed  
           
    methods(Access=protected)
        
        function makeTuples(self, key)
            %error 'this table is populated in python'
            %self.insert(key)
        end
    end
 
end