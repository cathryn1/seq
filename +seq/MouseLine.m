%{
# Transgenice mouse line info
line            : varchar(100)           # Mouse Line Abbreviation
---
full_line_name=""           : varchar(100)                  
recipient_strain=""         : varchar(20)                   
donor_strain=""             : varchar(20)                 # donor strain
n=null                      : tinyint                       # minimum number of backcrosses to recipient strain
construct=""                : varchar(5000)        # sequence of transgene construct, if available
line_notes=""               : varchar(4096)                 # other comments
line_ts=CURRENT_TIMESTAMP   : timestamp                     # automatic
%}

classdef MouseLine < dj.Manual
end