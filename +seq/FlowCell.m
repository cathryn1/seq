%{
# 
-> seq.Run
---
flowcell                    : varchar(255)                  # flowcell used on this run
run_date                    : date                          # run date
%}


classdef FlowCell < dj.Imported

	methods(Access=protected)

		function makeTuples(self, key)
            error 'this table is populated in python'
			 self.insert(key)
		end
	end

end
