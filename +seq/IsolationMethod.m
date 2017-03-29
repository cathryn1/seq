%{
# cell isolation method 
iso_meth  : char(20)  # short name e.g. dissociation, cellsort, patching 
-----
%}

classdef IsolationMethod < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'dissociation' 
                'cellsort' 
                'patching'  
            })
        end
    end
end