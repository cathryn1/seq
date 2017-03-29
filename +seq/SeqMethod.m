%{
# Sequencing method
seq_meth  : varchar(50)  #  e.g. 'Hi-Seq 2500 ver 3.1'
-----
num_lanes  : tinyint  # number of lanes in the sequencing run
%}

classdef SeqMethod < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'Hi-Seq 2500 ver 3.1'  12
                'Hi-Seq 2500 ver 3.2'  14               
                })
        end
    end
end