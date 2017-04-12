%{
# 
-> seq.Run
---
flow_cell                   : varchar(255)                  # flowcell used on this run
run_date                    : date                          # run date
%}


classdef FlowCell < dj.Imported

	methods(Access=protected)

		function makeTuples(self, key)
		%!!! compute missing fields for key here
			 self.insert(key)
		end
	end

end
