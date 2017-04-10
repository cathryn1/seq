%{
# sequencing library preparation protocol 
lib_meth: varchar(20) # short name of library preparation method
-----
%}

classdef LibraryProtocol < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'Nextera XT' 
                'Nextera XT v2' 
            })
        end
    end
end