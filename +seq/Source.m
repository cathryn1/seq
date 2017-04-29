%{
# sample type used as source of genetic material
source                      : varchar(20)                   # short name of source of genetic material
---
-> seq.Species
%}

classdef Source < dj.Lookup
    properties
        contents = {
            'mouse'           'mouse'
            'human'           'human'
            'rat'             'rat'
            'rhesus macaque'  'rhesus macaque'
            'MEF cells'       'mouse'
            'HEK293 cells'    'human'            
            }
    end
end
