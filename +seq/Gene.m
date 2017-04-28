%{
# list of genes
assembly: varchar(20) # short name of genome

-----
%}

classdef Genome < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'hg 19'
                'hg38'
                'mm9'
                'mm10'
                'RFP'
            })
        end
    end
end