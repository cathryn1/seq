%{
# Sequence reads from each lane
-> seq.Lane
read_id:  int unsigned   # read number within the lane 
-----
read_seq: varchar(100)  # sequence of actual read
read_qc: varchar (100) # quality control measure for the read sequence
index_seq: varchar (50) # sequence of the index
index_qc: varchar(100) # quality control measure for the index sequence

%}

classdef Read < dj.Imported

	methods(Access=protected)

		function makeTuples(self, key)
		%!!! compute missing fields for key here
			 self.insert(key)
		end
	end

end