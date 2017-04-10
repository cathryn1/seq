%{
# method of obtaining single cell samples 
iso_meth  : char(20)  # short name of method for isolating single cells 
-----
%}

classdef IsolationMethod < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'FACS sorting' 
                'Fluidigm' 
                'Manual cell picking'  
                'Patching'
                'Laser capture microdissection'
            })
        end
    end
end