%{
# index primers used to give each sample a unique id 
-> seq.LibraryProtocol
index_name: varchar(20) # name of index primer
-----
adapter_type=null:  varchar(10)     # type of adapter
adapter_seq=null:   varchar(20)     #adapter sequence
sheet_seq_2000=null:    varchar(20)     # sequence to enter in sample sheet for MiSeq and HiSeq2000/2500
sheet_seq_3000=null:    varchar(20)     # sequence to enter in sample sheet for MiniSeq, NextSeq, and HiSeq3000/4000
%}

classdef IndexPrimer < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'Nextera XT v2' 'N701' 'i7' 'TCGCCTTA' 'TAAGGCGA' 'TAAGGCGA'
                'Nextera XT v2' 'N702' 'i7' 'CTAGTACG' 'CGTACTAG' 'CGTACTAG'
                'Nextera XT v2' 'N703' 'i7' 'TTCTGCCT' 'AGGCAGAA' 'AGGCAGAA'
                'Nextera XT v2' 'N704' 'i7' 'GCTCAGGA' 'TCCTGAGC' 'TCCTGAGC'
                'Nextera XT v2' 'N705' 'i7' 'AGGAGTCC' 'GGACTCCT' 'GGACTCCT'
                'Nextera XT v2' 'N706' 'i7' 'CATGCCTA' 'TAGGCATG' 'TAGGCATG'
                'Nextera XT v2' 'N707' 'i7' 'GTAGAGAG' 'CTCTCTAC' 'CTCTCTAC'
                'Nextera XT v2' 'N710' 'i7' 'CAGCCTCG' 'CGAGGCTG' 'CGAGGCTG'
                'Nextera XT v2' 'N711' 'i7' 'TGCCTCTT' 'AAGAGGCA' 'AAGAGGCA'
                'Nextera XT v2' 'N712' 'i7' 'TCCTCTAC' 'GTAGAGGA' 'GTAGAGGA'
                'Nextera XT v2' 'N714' 'i7' 'TCATGAGC' 'GCTCATGA' 'GCTCATGA'
                'Nextera XT v2' 'N715' 'i7' 'CCTGAGAT' 'ATCTCAGG' 'ATCTCAGG'
                'Nextera XT v2' 'N716' 'i7' 'TAGCGAGT' 'ACTCGCTA' 'ACTCGCTA'
                'Nextera XT v2' 'N718' 'i7' 'GTAGCTCC' 'GGAGCTAC' 'GGAGCTAC'
                'Nextera XT v2' 'N719' 'i7' 'TACTACGC' 'GCGTAGTA' 'GCGTAGTA'
                'Nextera XT v2' 'N720' 'i7' 'AGGCTCCG' 'CGGAGCCT' 'CGGAGCCT'
                'Nextera XT v2' 'N721' 'i7' 'GCAGCGTA' 'TACGCTGC' 'TACGCTGC'
                'Nextera XT v2' 'N722' 'i7' 'CTGCGCAT' 'ATGCGCAG' 'ATGCGCAG'
                'Nextera XT v2' 'N723' 'i7' 'GAGCGCTA' 'TAGCGCTC' 'TAGCGCTC'
                'Nextera XT v2' 'N724' 'i7' 'CGCTCAGT' 'ACTGAGCG' 'ACTGAGCG'
                'Nextera XT v2' 'N726' 'i7' 'GTCTTAGG' 'CCTAAGAC' 'CCTAAGAC'
                'Nextera XT v2' 'N727' 'i7' 'ACTGATCG' 'CGATCAGT' 'CGATCAGT'
                'Nextera XT v2' 'N728' 'i7' 'TAGCTGCA' 'TGCAGCTA' 'TGCAGCTA'
                'Nextera XT v2' 'N729' 'i7' 'GACGTCGA' 'TCGACGTC' 'TCGACGTC'
                'Nextera XT v2' 'S502' 'i5' 'CTCTCTAT' 'CTCTCTAT' 'ATAGAGAG'
                'Nextera XT v2' 'S503' 'i5' 'TATCCTCT' 'TATCCTCT' 'AGAGGATA'
                'Nextera XT v2' 'S505' 'i5' 'GTAAGGAG' 'GTAAGGAG' 'CTCCTTAC'
                'Nextera XT v2' 'S506' 'i5' 'ACTGCATA' 'ACTGCATA' 'TATGCAGT'
                'Nextera XT v2' 'S507' 'i5' 'AAGGAGTA' 'AAGGAGTA' 'TACTCCTT'
                'Nextera XT v2' 'S508' 'i5' 'CTAAGCCT' 'CTAAGCCT' 'AGGCTTAG'
                'Nextera XT v2' 'S510' 'i5' 'CGTCTAAT' 'CGTCTAAT' 'ATTAGACG'
                'Nextera XT v2' 'S511' 'i5' 'TCTCTCCG' 'TCTCTCCG' 'CGGAGAGA'
                'Nextera XT v2' 'S513' 'i5' 'TCGACTAG' 'TCGACTAG' 'CTAGTCGA'
                'Nextera XT v2' 'S515' 'i5' 'TTCTAGCT' 'TTCTAGCT' 'AGCTAGAA'
                'Nextera XT v2' 'S516' 'i5' 'CCTAGAGT' 'CCTAGAGT' 'ACTCTAGG'
                'Nextera XT v2' 'S517' 'i5' 'GCGTAAGA' 'GCGTAAGA' 'TCTTACGC'
                'Nextera XT v2' 'S518' 'i5' 'CTATTAAG' 'CTATTAAG' 'CTTAATAG'
                'Nextera XT v2' 'S520' 'i5' 'AAGGCTAT' 'AAGGCTAT' 'ATAGCCTT'
                'Nextera XT v2' 'S521' 'i5' 'GAGCCTTA' 'GAGCCTTA' 'TAAGGCTC'
                'Nextera XT v2' 'S522' 'i5' 'TTATGCGA' 'TTATGCGA' 'TCGCATAA'
            })
        end
    end
end