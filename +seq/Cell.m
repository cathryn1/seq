%{
# cell  
-> seq.LibraryPrep
cell_id : int  # cell number within each experiment
-----
adapter_sequence : varchar(16)   # cell-specific base sequence 
%}

classdef Cell < dj.Imported

	methods(Access=protected)

		function makeTuples(self, key)
            filename = fetch1(seq.Experiment & key, 'csv_path');
            % read data from filename 
%             ...
%             for i=1:ncells
%                 key.cell_id = i
%                 self.insert(key)
%             end
		end
	end

end