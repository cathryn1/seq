%{
# 
-> seq.Read
-> seq.DemuxInfo
---
-> seq.PooledSample
%}


classdef DemuxRead < dj.Imported

	methods(Access=protected)

		function makeTuples(self, key)
		%!!! compute missing fields for key here
			 self.insert(key)
		end
	end

end