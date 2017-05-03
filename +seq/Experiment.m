%{
# list of scRNA-seq experiments with data stored in the schema, ideally, this should correspond the folder name where raw data is stored on Rickrad's server
exp_name: varchar(40) # name of the experiment
---
exp_path: varchar(255)  # path to raw data files
%}

classdef Experiment < dj.Lookup
    methods
        function fill(self)
            self.inserti({
            'PatchSeqColumns' '/mnt/kauffman/sandberglab/pipeline3.0/rnaseq/mmu/PatchSeqColumns'
            'PatchSeqMorphology' '/mnt/kauffman/sandberglab/pipeline3.0/rnaseq/mmu/PatchSeqColumns'
            })
        end
    end
end

