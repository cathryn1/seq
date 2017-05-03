%% add single cells to seq.Subject and seq.Sample

clear m

subjects = unique(subjectID);
for i = 1:length(subjects)
    m(i).subject_id = ['AT' num2str(subjects(i))];
    m(i).source = 'mouse';
end

insert(seq.Subject,m)
disp('Subjects inserted to seq.Subject')

clear m

for i = 1:length(sampleID)
    m(i).subject_id = ['AT' num2str(subjectID(i))];
    m(i).sample_id = sampleID{i};
    m(i).sample_type = 'Single cell';
    m(i).iso_meth = 'Patching ex vivo';
    m(i).exp_date = ['20' expDate{i}(1:2) '-' expDate{i}(3:4) '-' expDate{i}(5:6)];
    if subjectID(i)==13565 || subjectID(i)==13567
        m(i).spike_in = 'ERCC4ee-6, contaminated';
    elseif subjectID(i)==13807 || subjectID(i)==13801
        m(i).spike_in = 'ERCC4ee-5';
    else
        m(i).spike_in = 'ERCC4ee-6';
    end
    m(i).cdna_amp_meth = 'PatchSeq-v1';
    m(i).sample_qc_length = sampleQClength(i);
    m(i).sample_qc_yield = sampleQCyield(i)*15/1000;
end

insert(seq.Sample,m)
disp('Samples inserted to seq.Sample')

%% add sample info to seq.LibrarySample and seq.PooledSample

clear m n

for i = 1:length(sampleID)
    m(i).lib_id = '170406PatchSeqColumns';
    m(i).lib_samp_id  = libSampID{i};
    m(i).subject_id = ['AT' num2str(subjectID(i))];
    m(i).sample_id = sampleID{i};
    m(i).cdna_input = 300;
    m(i).rxn_volume = 10;
    m(i).index_1 = index1{i};
    m(i).index_2 = index2{i};
    m(i).plate_no = str2num(plateNo{i});
    m(i).row = well{i}(1);
    m(i).column_no = str2num(well{i}(2:end));
end

insert(seq.LibrarySample,m)

for i = 1:length(sampleID)
    n(i).pool_id = '170406PatchSeqColumns';
    n(i).lib_id = m(i).lib_id;
    n(i).lib_samp_id = m(i).lib_samp_id;
end

insert(seq.PooledSample,n)
    
    


%% add experimental info to seq.PatchSeqColumns and seq.PatchSeqMorphology

count = 0;
time = [7 10 8 15];
morph = {'pyramidal','pyramidal','neurogliaform','pyramidal'};

for i = 1:length(sampleID)
    clear m
    m.subject_id = ['AT' subjectID{i}];
    m.sample_id = sampleID{i};
    m.pipette_res = pipetteRes(i);
    if strcmp(layer(i),'4?')
        m.layer = '4';
    elseif strcmp(layer(i),'5?')
        m.layer = '5';
    elseif strcmp(layer(i),'5A')
        m.layer = '5';
    elseif strcmp(layer(i),'23')
        m.layer = '2/3';
    else
        m.layer = layer{i};
    end
    if strcmp(firingPattern(i),'fast-spiking?')
        m.firing_pattern = 'unknown';
    elseif strcmp(firingPattern(i),'fast-spiking')
        m.firing_pattern = 'fast spiking';
    elseif strcmp(firingPattern(i),'regular-spiking interneuron')
        m.firing_pattern = 'regular spiking';
    else
        m.firing_pattern = firingPattern{i};
    end
    m.asp = asp{i};
    if strcmp(label(i),'Morphology')
        count = count + 1;
        m.label = 'negative';
        m.slice = slice{i};
        m.exp_name = 'PatchSeqMorphology';
        m.internal = 'K-gluconate 01/2017';
        m.rri_conc = 1;
        m.record_time = time(count);
        m.morph = morph{count};
        insert(seq.PatchSeqMorphology,m)
        continue
    elseif strcmp(label(i),'negative?')
        m.label = 'negative';
    elseif strcmp(label(i),'positive?')
        m.label = 'positive';
    else
        m.label = label{i};
    end
    m.slice = str2num(slice{i});
    m.exp_name = 'PatchSeqColumns';
    insert(seq.PatchSeqColumns,m)
    disp(['Data uploaded for ' num2str(i) '/' num2str(length(sampleID)) ' samples.'])
end



