%{
# Imported Fast QC data for each sequenced sample (fastqc output ofr each demultiplexed .fastq file)
->seq.PooledSample
---
total_sequences     :int unsigned       # total number of sequences in file
poor                : int unsigned      # number of sequences tagged as poor quality
length_min          : tinyint unsigned  # minimum sequence length
length_max          : tinyint unsigned  # maximum sequence length
perc_gc              : tinyint unsigned  # percent qc contect of all sequences
per_base_seq_qual   : enum('PASS','FAIL','WARN') # report comment on per base sequence quality 
per_tile_seq_qual   : enum('PASS','FAIL','WARN') # report comment on per tile sequence quality 
per_seq_qual_sc   : enum('PASS','FAIL','WARN') # report comment on per sequence quality scores
per_base_seq_cont   : enum('PASS','FAIL','WARN') # report comment on per base sequence content 
per_seq_gc_cont   : enum('PASS','FAIL','WARN') # report comment on per sequence gc content 
per_base_n_cont   : enum('PASS','FAIL','WARN') # report comment on per base n content 
seq_len_dist   : enum('PASS','FAIL','WARN') # report comment on sequence length distribution 
seq_dup_level   : enum('PASS','FAIL','WARN') # report comment on sequence duplication levels 
over_seq   : enum('PASS','FAIL','WARN') # report comment on overrepresented sequences 
adapt_cont   : enum('PASS','FAIL','WARN') # report comment on adapter content 
kmer_cont   : enum('PASS','FAIL','WARN') # report comment on kmer content 
%}

classdef FastQC < dj.Imported
    properties(Constant)
        rootDataPath = '/Users/cathryn/sandberglab/pipeline3.0/rnaseq/mmu/PatchSeqColumns/fastqc_report';
    end
    
    methods(Access=protected)
        
        function makeTuples(self, key)
            tuple = [];
            f = fullfile(self.rootDataPath, fetch1(seq.PooledSample & key, 'lib_samp_id'));
            folder = dir(fullfile(f,'*_fastqc'));
            if isempty(folder)
                file = dir(fullfile(f,'*.zip'));
                unzip(fullfile(f,file.name),f);
                folder = dir(fullfile(f,'*_fastqc'));
            end      
            fileID = fopen(fullfile(f,folder.name,'summary.txt'));
            data = textscan(fileID,'%q');
            tuple = key;
            tuple.per_base_seq_qual = data{1}{5};
            tuple.per_tile_seq_qual = data{1}{11};
            tuple.per_seq_qual_sc = data{1}{17};
            tuple.per_base_seq_cont = data{1}{23};
            tuple.per_seq_gc_cont = data{1}{29};
            tuple.per_base_n_cont = data{1}{35};
            tuple.seq_len_dist = data{1}{41};
            tuple.seq_dup_level = data{1}{46};
            tuple.over_seq = data{1}{51};
            tuple.adapt_cont = data{1}{55};
            tuple.kmer_cont = data{1}{59};
            fileID = fopen(fullfile(f,folder.name,'fastqc_data.txt'));
            data = textscan(fileID,'%q');
            tuple.total_sequences = str2num(data{1}{22});
            tuple.poor = str2num(data{1}{28});
            tuple.perc_gc = str2num(data{1}{33});
            length = strsplit(data{1}{31},'-');
            tuple.length_min = str2num(length{1});
            tuple.length_max = str2num(length{2});
            self.insert(tuple)
        end
    end               
end