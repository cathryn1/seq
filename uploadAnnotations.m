clear m

for i = 1:length(annGene)
    m(i).annotation_db = 'RefSeq';
    m(i).version = 1;
    m(i).ann_gene = annGene{i};
    m(i).ann_tx = annTx{i};
    m(i).assembly = 'mm10';
    m(i).gene_symbol = geneSymbol{i};
    if isempty(fetch(seq.Gene & ['gene_symbol="' m(i).gene_symbol '"']))
        newgene.assembly = 'mm10';
        newgene.gene_symbol = m(i).gene_symbol;
        insert(seq.Gene,newgene);
    end
    m(i).assembly_unit = assemblyUnit{i};
    m(i).ann_strand = annStrand{i};
    m(i).tx_start = txStart(i);
    m(i).tx_end = txEnd(i);
    m(i).cds_start = cdsStart(i);
    m(i).cds_end = cdsEnd(i);
    m(i).cds_start_stat = cdsStartStat{i};
    m(i).cds_end_stat = cdsEndStat{i};
    m(i).exon_count = exonCount(i);
    insert(seq.AnnotatedGene,m(i));
    disp([num2str(i) '/' num2str(length(annGene)) ' annotated genes inserted'])
end

clear n
count = 0;

for i = 1:length(annGene)
    exonStart = strsplit(exonsStart{i},',');
    exonEnd = strsplit(exonsEnd{i},',');
    exonFrame = strsplit(exonsFrame{i},',');
    for j = 1:m(i).exon_count
        count = count + 1;
        n(count).annotation_db = m(i).annotation_db;
        n(count).version = m(i).version;
        n(count).ann_gene = m(i).ann_gene;
        n(count).ann_tx = m(i).ann_tx;
        n(count).assembly = m(i).assembly;
        n(count).assembly_unit = m(i).assembly_unit;
        n(count).tx_start = m(i).tx_start;
        n(count).exon = num2str(j);
        n(count).exon_start = str2num(exonStart{j});
        n(count).exon_end = str2num(exonEnd{j});
        n(count).exon_frame = str2num(exonFrame{j});
        insert(seq.Exon,n(count))
    end
    disp(['Exons inserted for ' num2str(i) '/' num2str(length(annGene)) 'annotated genes']) 
end
