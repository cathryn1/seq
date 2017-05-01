%{
# list of genes in the genome
-> seq.Genome
gene_symbol                 : varchar(20)                   # official gene symbol
---
mgi_id=null                 : int unsigned                  # MGI accession ID
gene_type=null              : varchar(30)                   # type of gene, i.e. gene, pseudogene
gene_name=null              : varchar(255)                  # full gene name
entrez_id=null              : int unsigned                  # Entrez gene ID
ncbi_chr=null               : varchar(2)                    # NCBI gene chromosome
ncbi_start=null             : int unsigned                  # NCBI gene start
ncbi_end=null               : int unsigned                  # NCBI gene end
ncbi_strand=null            : char(1)                       # NCBI strand, + or -
ensembl_id=null             : char(18)                      # Ensembl gene ID
ensembl_chr=null            : varchar(2)                    # Ensembl gene chromosome
ensembl_start=null          : int unsigned                  # Ensembl gene start
ensembl_end=null            : int unsigned                  # Ensembl gene end
ensembl_strand=null         : char(1)                       # Ensembl strand, + or -
vega_id=null                : char(18)                      # VEGA gene ID
vega_chr=null               : varchar(2)                    # VEGA gene chromosome
vega_start=null             : int unsigned                  # VEGA gene start
vega_end=null               : int unsigned                  # VEGA gene end
vega_strand=null            : char(1)                       # VEGA strand, + or -
%}

classdef Gene < dj.Manual
end
