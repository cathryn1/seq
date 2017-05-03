%{
# experiment-specific informaiton about samples in the PatchSeqMorphology experiment
->seq.Sample
---
->seq.Experiment
slice:  varchar(20)    # slice id for this cell (contains stained cell body)
morph="unknown": enum('pyramidal','spiny stellate','basket','chandelier','Martinotti','neurogliaform','single bouquet','double bouquet','bipolar','horizontally elongated','deep projecting','shrub','undetermined interneuron','unknown')   # morphological subtype, if known
pipette_res=null: double    # pipette resistance used for aspiration of cell contents, if known
internal: enum('K-gluconate 01/2017','K-methyl sulfate from Shan','other','unknown')  # internal solution used
rri_conc: double    # amount of recombinant RNase inhibitor added to internal solution, in U/ul
label:  enum('positive','negative','unknown')    # whether cell was observed to express fluorescent marker (tdTomato)
layer: enum('1','2/3','4','5','6','unknown')    # layer position of cell
firing_pattern: enum('excitatory','excitatory-burst','fast spiking','regular spiking','neurogliaform','unknown')     # firing pattern of cell
record_time=null:   tinyint unsigned    # recording time, in minutes from break in to pipette removal
asp: enum('FS','XJ','SL','BL','DWK','ALW','GL','unknown')   # initials of person who aspirated cell contents
%}

classdef PatchSeqMorphology < dj.Manual
end