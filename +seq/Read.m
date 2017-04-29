%{
# 
-> seq.Lane
read_id                     : int                           # sequential id
---
read_seq                    : varchar(100)                  # base64 ASCII-encoded sequence of actual read
read_qc                     : varchar(100)                  # quality control measure for the read sequence
index1_seq                  : varchar(50)                   # base64 ASCII-encoded sequence of the index
index1_qc                   : varchar(100)                  # quality control measure for the index sequence
index2_seq                  : varchar(50)                   # base64 ASCII-encoded sequence of the index
index2_qc                   : varchar(100)                  # quality control measure for the index sequence
%}

classdef Read < dj.Imported
       
    methods(Access=protected)
        
        function makeTuples(self, key)
            error 'this table is populated in python'
            self.insert(key)
        end
    end
    
end
