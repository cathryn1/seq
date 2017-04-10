%{
# cDNA amplification method 
cdna_amp_meth  : char(20)  # short name e.g. SmartSeq2-v3
-----
tso=null: varchar(100) # sequence of template switching oligonucleotide where rG indicates riboguanosine and +G indicates a locked nucleic acid-modified guanosine
n_cycles=null: tinyint unsigned # number of PCR cycles for amplification of full length cDNA
rt_enzyme=null: varchar(20) # reverse transcritpion enzyme used
bead_ratio=null: varchar(20) # ratio of beads to cDNA during PCR purification
n_washes=null: tinyint unsigned # number of times beads are washed with 80% ethanol 

%}

classdef AmplificationMethod < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'SmartSeq2-v1' 'AAGCAGTGGTATCAACGCAGAGTACrGrG+G' 18 'Superscript II RT' '0.8:1' 0
                'PatchSeq-v1' 'AAGCAGTGGTATCAACGCAGAGTACrGrG+G' 18 'Superscript II RT' '0.7:1' 2
            })
        end
    end
end