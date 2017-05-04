%{
#
seq_primers                 : varchar(30)                   # primers used for sequencing, e.g. Nextera s7+i5
%}


classdef SequencingPrimers < dj.Lookup
    properties(Constant)
        contents = {
            'Nextera s7+i5'
            }
    end
end