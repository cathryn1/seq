%{
# information about each sequencing run
run_id                      : varchar(20)             # unique id for each run
---
->seq.FlowCell
file_pattern                : varchar(255)                  # data folder for the filede
machine                     : varchar(25)                   # machine used for sequencing, i.e. HiSeq 2500
%}

classdef Run < dj.Manual
end
