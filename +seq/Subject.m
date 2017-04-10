%{
# informaiton about each subject
subject_id: varchar(20) # unique id for each experimental subject. Prefix to indicate lab of origin, e.g. ATXXXX for Tolias lab, RSXXXX for Sandberg lab
---
->seq.Source
%}

classdef Subject < dj.Manual
end

