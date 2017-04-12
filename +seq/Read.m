%{
# 
-> seq.Lane
read_id                     : char(16)                      # machine-assigned id
---
read_seq                    : varchar(100)                  # sequence of actual read
read_qc                     : varchar(100)                  # quality control measure for the read sequence
index1_seq                  : varchar(50)                   # sequence of the index
index1_qc                   : varchar(100)                  # quality control measure for the index sequence
index2_seq                  : varchar(50)                   # sequence of the index
index2_qc                   : varchar(100)                  # quality control measure for the index sequence
%}

classdef Read < dj.Imported
       
    methods(Access=protected)
        
        function makeTuples(self, key)
            %!!! compute missing fields for key here
            self.insert(key)
        end
    end
    
end
