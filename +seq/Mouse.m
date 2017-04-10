%{
# mouse-specific information
-> seq.Subject
---
dob=null                    : date                          # animal's date of birth
dow=null                    : date                          # animal's date of weaning
sex="unknown"               : enum('M','F','unknown')       # animal's sex
mouse_notes=null            : varchar(4096)                 # other comments and distinguishing features
mouse_ts=CURRENT_TIMESTAMP  : timestamp                     # automatic
%}

classdef Mouse < dj.Manual
end
