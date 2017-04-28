%{
# Information about how the raw data from each lane of a sequencing run was demultiplexed
->seq.Lane
demult_id: tinyint unsigned     # unique id for this demultiplexing procedure
---
demult_path=""  : varchar(255)  # path to code used for demultiplexing
demult_user=""  : varchar(25)   # person who ran the demultiplexing, i.e. 'Cathryn' or 'Sequencing Core'
demult_date=null    : date      # date demultiplexing was done
%}

classdef DemultInfo < dj.Manual
end