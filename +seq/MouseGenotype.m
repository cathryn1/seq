%{
# info about each mouse's genotype
-> seq.Mouse
-> seq.MouseLine
---
genotype="unknown"          : enum('homozygous','heterozygous','hemizygous','positive','negative','wild type','unknown') # animal's genotype
genotype_notes              : varchar(4096)                 # other comments
genotype_ts=CURRENT_TIMESTAMP: timestamp                    # automatic
%}

classdef MouseGenotype < dj.Manual
end