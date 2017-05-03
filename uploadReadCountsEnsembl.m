
ann = 'ensembl';
ann_db = 'Ensembl';
cd /Users/Cathryn/Dropbox/'Microcolumn Patch-seq data'/rpkmforgenes_star_mm10/ensembl/

file = dir([cd '/*.txt']);
mousegenes = fetchn(seq.Gene & 'assembly="mm10"','gene_symbol');

for i = 1:length(file)
    clear m n geneRPKM
    count = 0;
    libSampleID = extractBefore(file(i).name,['_' ann '.txt']);
    fileID = fopen(file(i).name);
    if isempty(fetch(seq.GeneReadCount & ['annotation_db="' ann_db '"'] & ['lib_samp_id="' libSampleID '"']))
        data = textscan(fileID,'%q');
        gene = data{1}(30:4:end);
        rpkm = data{1}(32:4:end);
        readcount = data{1}(33:4:end);
        for j = 1:length(gene)
            if any(strcmp(mousegenes,gene(j))) && sum(length(find(strcmp(gene,gene(j)))))==1
                count = count + 1;
                m(count).pool_id = '170406PatchSeqColumns';
                m(count).lib_id = '170406PatchSeqColumns';
                m(count).lib_samp_id = libSampleID;
                m(count).assembly = 'mm10';
                m(count).gene_symbol = gene{j};
                m(count).annotation_db = ann_db;
                m(count).version = 1;
                m(count).gene_read_count = str2num(readcount{j});
                geneRPKM{count} = str2num(rpkm{j});
            end
        end
        n = rmfield(m,'gene_read_count');
        [n(:).gene_rpkm] = geneRPKM{:};
        insert(seq.GeneReadCount,m)
        insert(seq.GeneRPKM,n)
    end
    disp([num2str(i) '/' num2str(length(file)) ' files uploaded'])
end

 

