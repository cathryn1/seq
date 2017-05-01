m = [];


for i = 1:length(mgiID)
    m(i).assembly = 'mm10';
    m(i).gene_symbol = geneSymbol{i};
    m(i).mgi_id = mgiID(i);
    m(i).gene_type = geneType{i};
    m(i).gene_name = geneName{i};
    m(i).entrez_id = entrezID(i);
    if strcmp(ncbiChr{i},'null')
        m(i).ncbi_chr = '';
        m(i).ncbi_strand = '';
    else
        m(i).ncbi_chr = ncbiChr{i};
        m(i).ncbi_strand = ncbiStrand{i};
    end
    m(i).ncbi_start = ncbiStart(i);
    m(i).ncbi_end = ncbiEnd(i);
    if strcmp(ensemblID{i},'null')
        m(i).ensembl_id = '';
        m(i).ensembl_chr = '';
        m(i).ensembl_strand = '';
    else
        m(i).ensembl_id = ensemblID{i};
        m(i).ensembl_chr = ensemblChr{i};
        m(i).ensembl_strand = ensemblStrand{i};
    end
    m(i).ensembl_start = ensemblStart(i);
    m(i).ensembl_end = ensemblEnd(i);
    if strcmp(vegaID{i},'null')
        m(i).vega_id = '';
        m(i).vega_chr = '';
        m(i).vega_strand = '';
    else
        m(i).vega_id = vegaID{i};
        m(i).vega_chr = vegaChr{i};
        m(i).vega_strand = vegaStrand{i};
    end
    m(i).vega_start = vegaStart(i);
    m(i).vega_end = vegaEnd(i);
    insert(seq.Gene,m(i))
    disp(num2str(i))
end