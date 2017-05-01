%{
# Information about each alignment (import from .bam file)
->seq.Alignment
->seq.AnnotationDatabase
->seq.AnnotatedGene
---
map_loc: double     # read location with respect to entire gene body
map_type:   enum('exon','intron','5"-UTR','3"-UTR')    # type of map, called exon if 100% of read maps to annotated exons(s) including putative splice junctions, called intron if 100% mapped to intron or mix of intron/exon, called UTR if all or partially mapped to UTR
map_poss_splice: enum('yes','no')    # possible splice site, i.e. maps to more than one annotated exon 
%}

classdef AnnotatedAlignment < dj.Computed
    methods(Access=protected)
        
        function makeTuples(self, key)
            %error 'this table is populated in python'
            %self.insert(key)
        end
    end
end