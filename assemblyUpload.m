genome = 'mm10';

filedir = ['/Users/cathryn/dna/genomes/chrom/' genome];
cd(filedir)
m = [];
m.assembly = genome;
file = dir([filedir '/*.txt']);

for i = 1:length(file)
    libSampleID = 
    fileID = fopen(unitfile(i).name);
    data = textscan(fileID,'%q');
    m.assembly_unit = extractAfter(data{1}{1},'>');
    m.assembly_seq = strjoin(data{1}(2:end),'');
    insert(seq.AssemblyUnit, m)
    disp([num2str(i) '/' num2str(length(unitfile)) ' files complete'])
end