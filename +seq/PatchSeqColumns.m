%{
# experiment-specific informaiton about samples in the PatchSeqColumns experiment
->seq.Sample
---
->seq.Experiment
slice:  tinyint unsigned    # slice number for this animal
pipette_res=null: double    # pipette resistance used for aspiration of cell contents, if known
label:  enum('positive','negative','unknown')    # whether cell was observed to express fluorescent marker (tdTomato)
layer: enum('1','2/3','4','5','6','unknown')    # layer position of cell
firing_pattern: enum('excitatory','excitatory-burst','fast spiking','regular spiking','neurogliaform','unknown')     # firing pattern of cell
asp: enum('FS','XJ','SL','BL','DWK','ALW','GL','unknown')   # initials of person who aspirated cell contents
%}

classdef PatchSeqColumns < dj.Manual
end