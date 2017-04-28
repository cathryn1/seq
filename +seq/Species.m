%{
# Source of genetic material 
species: varchar(20) # short name of species
----- 
species_name: varchar(100)  # long name of species
%}

classdef Species < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'mouse' 'mus musculus'
                'human' 'homo sapiens'
                'rat' 'rattus novegicus'
                'rhesus macaque' 'macaca mulatta'
            })
        end
    end
end