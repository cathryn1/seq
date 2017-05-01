%{
# genome assembly used for alignment
assembly: varchar(20) # short name of genome assembly
-----
-> seq.Species
source_location = ''  : varchar(255)  # a file or ftp or
%}

classdef Genome < dj.Lookup
    
    properties
        contents = {
            'hg19' 'human'  'ftp://hgdownload.soe.ucsc.edu/goldenPath/hg19/chromosomes/'
            'hg38' 'human'  'ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/'
            'mm9'  'mouse'  'ftp://hgdownload.soe.ucsc.edu/goldenPath/mm9/chromosomes/'
            'mm10' 'mouse'  'ftp://hgdownload.soe.ucsc.edu/goldenPath/mm10/chromosomes/'
            'RFP'  '' ''
            'eGFP' '' ''
            }
    end
    
end