%{
# type of library
lib_type: varchar(20) # short name of library type
-----
%}

classdef LibraryType < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'PolyA+RNA-seq' 
            })
        end
    end
end