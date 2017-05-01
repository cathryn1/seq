%{
# Information about how demultiplexing was performed
demult_id: tinyint     # unique id for this demultiplexing procedure
---
demult_path=""  : varchar(255)  # path to code used for demultiplexing, if known
demult_user=""  : varchar(25)   # person who ran the demultiplexing, i.e. 'Cathryn' or 'Sequencing Core'
demult_date=null    : date      # date demultiplexing was done
%}

classdef DemultInfo < dj.Manual
end