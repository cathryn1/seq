%{
# information about each lane within a sequencing run
-> seq.Run
lane                        : tinyint unsigned              # lane number within the run (1-8)
---
-> seq.SequencingPrimers
-> seq.Pool
%}


classdef Lane < dj.Manual
end
