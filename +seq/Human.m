%{
# information about human subjects
-> seq.Subject
-----
age: decimal(4,1) #  age in years at sample collection
sex: enum('M','F','other','unknown')  #
%}

classdef Human < dj.Manual
end