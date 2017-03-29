%{
# Sequencing library preparation for subject
-> seq.Subject
-----
-> seq.IsolationMethod
-> seq.LibraryPrepMethod
csv_path   :  varchar(255)  # path to CSV with cell data
experiment_date : date  #  the date of cell isolation 
%}

classdef LibraryPrep < dj.Manual
end