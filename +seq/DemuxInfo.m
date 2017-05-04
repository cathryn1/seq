%{
# Information about how demultiplexing was performed
demux_id                    : tinyint                       # unique id for this demultiplexing procedure
---
demux_path                  : varchar(255)                  # path to code used for demultiplexing, if known
demux_user                  : varchar(25)                   # person who ran the demultiplexing, i.e. 'Cathryn' or 'Sequencing Core'
demux_date=null             : date                          # date demultiplexing was done
%}


classdef DemuxInfo < dj.Manual
end