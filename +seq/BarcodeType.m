%{
# type of barcode
barcode_type: varchar(20) # short name of barcode type
-----
%}

classdef BarcodeType < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'Nextera XT dual' 
            })
        end
    end
end