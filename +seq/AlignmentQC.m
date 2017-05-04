%{
# QC metrics computed for reads aligned to the genome, imported from summary_starlog.txt
->seq.PooledSample
->seq.Genome
---
total_reads     :int unsigned       # total number of reads for each pooled sample
read_length :   tinyint unsigned    # read length
uniquemap_reads       : double            # percent of reads uniquely mapping to the genome
multimap_reads           :double             # percent of reads mapping to multiple loci in the genome
nonmap_reads             : double            # percent of reads not mapping to the genome 
splices     : int unsigned  # total number of splices for this sample
non_canon_splices  : double    # percent of (reads/splices?) that are non-canonical
%}

classdef AlignmentQC < dj.Imported  
    properties(Constant)
        rootDataPath = '/Users/cathryn/sandberglab/pipeline3.0/rnaseq/mmu/PatchSeqColumns/qc_star';
    end
    
    properties
        keySource = seq.PooledSample*seq.Genome & seq.AlignmentInfo;
    end
         
    methods(Access=protected)
        
        function makeTuples(self, key)
           tuple = [];
           f = fullfile(self.rootDataPath, 'summary_starlog.txt');
           fileID = fopen(f);
           data = textscan(fileID,'%q');
           libSampID = data{1}(17:9:end);
           totalReads = data{1}(19:9:end);
           readLength = data{1}(20:9:end);
           uniquemapReads = data{1}(21:9:end);
           multimapReads = data{1}(22:9:end);
           nonmapReads = data{1}(23:9:end);
           splices = data{1}(24:9:end);
           nonCanonSplices = data{1}(25:9:end);
           tuple = key;
           for i = 1:length(libSampID)
               tuple.lib_samp_id = libSampID{i};
               tuple.total_reads = str2num(totalReads{i});
               tuple.read_length = str2num(readLength{i});
               tuple.uniquemap_reads = str2num(uniquemapReads{i});
               tuple.multimap_reads = str2num(multimapReads{i});
               tuple.nonmap_reads = str2num(nonmapReads{i});
               tuple.splices = str2num(splices{i});
               tuple.non_canon_splices = str2num(nonCanonSplices{i});
               self.insert(tuple)
           end
        end
    end
 
end