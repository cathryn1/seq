%{
# information about each sequencing run 
run_id : varchar(20)  # unique id for each run
-----
machine=null: varchar(25) # machine used for sequencing, i.e. HiSeq 2500
flowcell=null: varchar(25) # flowcell used on this run

%}

classdef Run < dj.Manual
end