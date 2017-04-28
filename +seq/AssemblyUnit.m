%{
# individual assembly units to be used for alignment
->seq.Genome
assembly_unit: varchar(40) # short name of assembly unit
-----
assembly_seq=null:     longblob     #full sequence of assembly unit, if known
%}

classdef AssemblyUnit < dj.Lookup
end