%{
# Source of genetic material
species: varchar(20) # short name of species
-----
species_name: varchar(100)  # long name of species
%}

classdef Species < dj.Lookup
    properties
        contents = {
            ''               'unspecified'
            'mouse'          'mus musculus'
            'human'          'homo sapiens'
            'rat'            'rattus novegicus'
            'rhesus macaque' 'macaca mulatta'
            }
    end
end