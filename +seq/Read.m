%{
# Sequence reads within a run
-> seq.Run
read_id  :  int   # read number within run 
-----
read_sequence : varchar(511)  
%}

classdef Read < dj.Imported

	methods(Access=protected)

		function makeTuples(self, key)
		%!!! compute missing fields for key here
			 self.insert(key)
		end
	end

end