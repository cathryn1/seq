%{
# 
primers                     : varchar(30)                   # primers used for sequencing, e.g. Nextera s7+i5
%}


classdef SequencingPrimers < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'Nextera s7+i5'
                })
        end
    end
end
