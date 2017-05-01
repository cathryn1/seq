%{
# 
->seq.Alignment
->seq.LibrarySample
---
total_reads     :int unsigned       # total number of reads 
read_length     : tinyint unsigned  # read length 
unique       : double            # percent of reads uniquely mapping to the genome
multi           :double             # percent of reads mapping to multiple loci in the genome
non             : double            # percent of reads not mapping to the genome
splices         : double            # number of splices
non_can_splices  : double            # percent of splices that are non-canonical 
%}

classdef RPKM < dj.Computed
       
    methods(Access=protected)
        
        function makeTuples(self, key)
            error 'this table is populated in python'
            self.insert(key)
        end
    end
    
end