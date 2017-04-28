%{
# genome assembly used for alignment
assembly: varchar(20) # short name of genome assembly
-----
species="":     varchar(20)     #short name of species, if applicable
%}

classdef Genome < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'hg19' 'human'
                'hg38' 'human'
                'mm9' 'mouse'
                'mm10' 'mouse'
                'RFP' ''
                'eGFP' ''
            })
        end
    end
end