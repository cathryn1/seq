
ann = 'refseq';
ann_db = 'RefSeq';

filedir = ['/Users/cathryn/dna/PatchSeqColumns/rpkmforgenes_star_mm10/' ann];
cd(filedir)

file = dir([filedir '/*.txt']);
mousegenes = fetchn(seq.Gene & 'assembly="mm10"','gene_symbol');

for i = 1%length(file)
    clear m n
    count = 0;
    libSampleID = extractBefore(file(i).name,['_' ann '.txt']);
    fileID = fopen(file(i).name);
    data = textscan(fileID,'%q');
    gene = data{1}(30:4:end);
    rpkm = data{1}(32:4:end);
    readcount = data{1}(33:4:end);
    for j = 1:length(gene)
        if any(strcmp(mousegenes,gene(j)))
            count = count + 1;
            m(count).pool_id = '170406PatchSeqColumns';
            m(count).lib_id = '170406PatchSeqColumns';
            m(count).lib_samp_id = libSampleID;
            m(count).assembly = 'mm10';
            m(count).gene_symbol = gene(j);
            m(count).annotation_db = ann_db;
            m(count).version = 1;
            m(count).gene_read_count = readcount(j);
            n = rmfield(m,'gene_read_count');
            n(count).gene_rpkm = rpkm(j);
        end
    end
    %insert(seq.GeneReadCount,m)
    %insert(seq.GeneRPKM,n)
    disp([num2str(i) '/' num2str(length(file)) ' files uploaded'])
end

 

