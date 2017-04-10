%{
# Source of genetic material 
source: varchar(20) # short name of source
-----
species="unknown"                 : enum('mouse','human','rat','macaque','other','unknown')   # species 

%}

classdef Source < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'mouse' 'mouse'
                'human' 'human'
                'rat' 'rat'
                'macaque' 'macaque'
                'MEF cells' 'mouse'
                'HEK293 cells' 'human'
            })
        end
    end
end