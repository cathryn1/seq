%{
# information about single cells collected from subjects  
-> seq.Subject
cell_id : varchar(20)  # unique id for each cell
-----
sample_type="unknown": enum('Single cell','Bulk','other','unknown') # type of sample
->seq.IsolationMethod
exp_date=null: date # date of cell collection
spike_in="unknown": enum('ERCC4ee-6','ERCC4ee-6, degraded','ERCC4ee-7','other','none','unknown') # positive control RNA spiked in to the sample
->seq.AmplificationMethod

%}

classdef Cell < dj.Manual
end