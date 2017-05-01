%{
# computed length of each gene, collapsing over all annotated transcripts
->seq.Gene
->seq.AnnotationDatabase
---
gene_length: int unsigned   # sum of all non-overlapping exons within the gene
%}

classdef GeneLength < dj.Computed
     methods(Access=protected)
        function makeTuples(self, key)
            %error 'this table is populated in python'
            %self.insert(key)
        end
    end
end