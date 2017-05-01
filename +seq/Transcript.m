%{
# list of transcripts from each annotation database
-> seq.AnnotationDatabase
transc_id                 : varchar(20)                   # unique id within annotation database
-------
transc_name=null   : varchar(255)      # full name of transcript
transc_gi=null  : int unsigned  # GeneInfo identifier for transcript, if available
transc_seq=null     : longblob  # full sequence of transcript, if available
%}

classdef Transcript < dj.Lookup
end