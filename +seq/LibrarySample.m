%{
# information about each sequencing library sample
-> seq.Library
lib_samp_id                 : varchar(20)                   # unique id for each sample in the library
---
-> seq.Sample
cdna_input=null     : smallint unsigned     # amount of cDNA used as input to the enrichment PCR, in picograms
rxn_volume=null     : tinyint unsigned  # reaction volume for the enrichment PCR, in microliters
index_1                     : varchar(20)             # First index (i7) inlcuding only the numeric values
index_2                     : varchar(20)             # Second index (i5) includeing only the numeric values
plate_no=null               : tinyint unsigned              # plate number for this library
row=null                    : char(1)                       # row letter denoted by A-G
column_no=null              : tinyint unsigned              # column number denoted by 1-12
%}

classdef LibrarySample < dj.Manual
end
