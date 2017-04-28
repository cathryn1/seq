%{
# Source of genetic material 
source: varchar(20) # short name of source
->seq.Species
----- 

%}

classdef Source < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'mouse' 'mouse'
                'human' 'human'
                'rat' 'rat'
                'rhesus macaque' 'rhesus macaque'
                'MEF cells' 'mouse'
                'HEK293 cells' 'human'
            })
        end
    end
end