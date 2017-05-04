%{
# QC metrics computed for mapped reads using specified annotation database
->seq.PooledSample
->seq.AnnotationDatabase
---
mapped_reads: int unsigned  # total number of mapped reads for each sample
exon_reads:     double  # percent of mapped reads mapping to annotated exon(s)
intron_reads:   double  # percent of mapped reads mapping to introns, or a combination of introns and exons
utr3_reads=null: double  # percent of mapped reads mapping to the 3' UTR, or a combination of 3' UTR and exon
utr5_reads=null: double   # percent of mapped reads mapping to the 5' UTR, or a combination of 5' UTR and exon
ig_reads:   double    # percent of mapped reads mapping that do not match an annotated gene
poss_splice_reads=null: double    # percent of mapped reads that represent possible splice sites
mordor_index=null:   double  # estimated severity of the 'mordor effect', i.e. a single peak in the gene body coverage
bias53=null:   double      # estimated slope of the 5' to 3' gene body coverage, filtered to remove sharp peaks 
%}

classdef MappingQC < dj.Imported  
    properties(Constant)
        rootDataPath = '/Users/cathryn/sandberglab/pipeline3.0/rnaseq/mmu/PatchSeqColumns/qc_star';
    end
    
    properties
        keySource = seq.PooledSample*seq.AnnotationDatabase & seq.AlignmentInfo;
    end
    
    methods(Access=protected)
        
        function makeTuples(self, key)
           tuple = [];
           if strcmp(key.annotation_db,'Ensembl')
               f = fullfile(self.rootDataPath, 'summary_exon_intron_igs_ensgene.txt');
           elseif strcmp(key.annotation_db,'RefSeq')
               f = fullfile(self.rootDataPath, 'summary_exon_intron_igs_refgene.txt');
           else
               disp(['No file available for ' key.annotation_db ' annotations for sample ' key.lib_samp_id '.'])
               return
           end
           fileID = fopen(f);
           data = textscan(fileID,'%q');
           libSampID = data{1}(5:4:end);
           exonReads = data{1}(6:4:end);
           intronReads = data{1}(7:4:end);
           igReads = data{1}(8:4:end);
           f = fullfile(self.rootDataPath, 'geneBody_coverage.r');
           fileID = fopen(f);
           data = textscan(fileID,'%q');
           data = strjoin(data{1},' ');
           tuple = key;
           for i = 1:length(libSampID)
               tuple.lib_samp_id = libSampID{i};
               tuple.exon_reads = str2num(exonReads{i});
               tuple.intron_reads = str2num(intronReads{i});
               tuple.ig_reads = str2num(igReads{i});
               tuple.mapped_reads = sum([tuple.exon_reads tuple.intron_reads tuple.ig_reads]);
               coverage = extractBetween(data,['V' tuple.lib_samp_id '_unique <- c('],') x=');
               if ~isempty(coverage)
                   coverage = str2num(coverage{1});
                   l = length(coverage);
                   tuple.mordor_index = max(coverage(round(l*.15+1):round(l*.85))/mean(coverage));
                   tuple.bias53 = mean(coverage(1:round(l*.15)))/mean(coverage(round(l*.85+1):end));
               end
               self.insert(tuple)
           end
        end
    end
end