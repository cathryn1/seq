%{
# 
->seq.AlignmentInfo
->seq.PooledSample
---
total_sequences     :int unsigned       # total number of sequences in file
poor                : int unsigned      # number of sequences tagged as poor quality
length_min          : tinyint unsigned  # minimum sequence length
length_max          : tinyint unsigned  # maximum sequence length
perc_gc              : tinyint unsigned  # percent qc contect of all sequences
per_base_seq_qual   : enum('Pass','Fail','Warning') # report comment on per base sequence quality 
per_tile_seq_qual   : enum('Pass','Fail','Warning') # report comment on per tile sequence quality 
per_seq_qual_sc   : enum('Pass','Fail','Warning') # report comment on per sequence quality scores
per_base_seq_cont   : enum('Pass','Fail','Warning') # report comment on per base sequence content 
per_seq_gc_cont   : enum('Pass','Fail','Warning') # report comment on per sequence gc content 
per_base_n_cont   : enum('Pass','Fail','Warning') # report comment on per base n content 
seq_len_dist   : enum('Pass','Fail','Warning') # report comment on sequence length distribution 
seq_dup_level   : enum('Pass','Fail','Warning') # report comment on sequence duplication levels 
over_seq   : enum('Pass','Fail','Warning') # report comment on overrepresented sequences 
adapt_cont   : enum('Pass','Fail','Warning') # report comment on adapter content 
kmer_cont   : enum('Pass','Fail','Warning') # report comment on kmer content 
%}

classdef FastQC < dj.Imported
       
    methods(Access=protected)
        
        function makeTuples(self, key)
            %error 'this table is populated in python'
            %self.insert(key)
        end
    end
    
end