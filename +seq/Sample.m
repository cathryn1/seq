%{
# information about single cells collected from subjects  
-> seq.Subject
sample_id : varchar(20)  # unique id for each single cell sample
-----
sample_type="unknown": enum('Single cell','Bulk','other','unknown') # type of sample
->seq.IsolationMethod
exp_date=null: date # date of cell collection
spike_in="unknown": enum('ERCC4ee-6','ERCC4ee-6, contaminated','ERCC4ee-5','other','none','unknown') # positive control RNA spiked in to the sample
->seq.AmplificationMethod
sample_qc_length=null:  smallint unsigned   # mean length of cDNA sample (from ~300-9000 bp) after PCR preamplification, determine on Agilent Bioanalyzer
sample_qc_yield=null: tinyint unsigned  # yield in ng of cDNA sample (from ~300-9000 bp) determined by Agilent Bioanalyzer
%}

classdef Sample < dj.Manual
end