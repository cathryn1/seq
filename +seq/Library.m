%{
# information about each sequencing library 
lib_id : varchar(40)  # unique id for each library
-----
->seq.LibraryType
->seq.LibraryProtocol
->seq.BarcodeType
person=null: varchar(20) # person who generated the library

%}

classdef Library < dj.Manual
end