%{
# information about each pool of cDNA sent for sequencing
pool_id                     : varchar(40)                   # unique if for pooled sample sent for sequencing
---
size=null                   : smallint unsigned             # mean size of pooled cDNA sent for sequencing (in bp)
conc=null                   : decimal(3,2)                  # final concentration of pooled cDNA sent for sequencing (in ng/ul)
%}

classdef Pool < dj.Manual
end
