%{
# QC metrics computed for mapped reads using specified annotation database
->seq.PooledSample
->seq.AnnotationDatabase
---
mapped_reads: int unsigned  # total number of mapped reads for each sample
exon_reads:     double  # percent of mapped reads mapping to annotated exon(s)
intron_reads:   double  # percent of mapped reads mapping to introns, or a combination of introns and exons
utr3_reads: double  # percent of mapped reads mapping to the 3' UTR, or a combination of 3' UTR and exon
utr5_reads: double   # percent of mapped reads mapping to the 5' UTR, or a combination of 5' UTR and exon
ig_reads:   double    # percent of mapped reads mapping that do not match an annotated gene
poss_splice_reads: double    # percent of mapped reads that represent possible splice sites
mordor_index:   double  # estimated severity of the 'mordor effect', i.e. a single peak in the gene body coverage
bias53:   double      # estimated slope of the 5' to 3' gene body coverage, filtered to remove sharp peaks 
%}

classdef MappingQC < dj.Computed  
           
    methods(Access=protected)
        
        function makeTuples(self, key)
            %error 'this table is populated in python'
            %self.insert(key)
        end
    end
 
end