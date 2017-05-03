%% First copy the data into a local folder
cd /Users/cathryn/sandberglab/pipeline3.0/rnaseq/mmu/PatchSeqColumns/star_mm10/

dirs = dir([cd '/170406*']);

for i = 88:length(dirs) % come back and do # 87, I think it was skipped
    file = [dirs(i).name '/' dirs(i).name '_unique.bam'];
    [status,msg,msgID] = copyfile(file,'/Users/cathryn/Dropbox/Microcolumn Patch-seq data/star_mm10');
    disp([num2str(i) '/' num2str(length(dirs)) ' .bam files copied.'])
end
    
%%

clear all

cd /Users/cathryn/Dropbox/'Microcolumn Patch-seq data'/star_mm10/

chrom = fetchn(seq.AssemblyUnit & 'assembly="mm10"','assembly_unit');

file = dir([cd '/*.bam']);
for i = 1:length(file)
    samplename = extractBefore(file(i).name,'_unique.bam');
    info = baminfo(file(i).name);
    dict = info.SequenceDictionary;
    for j = 1:length(dict)
        if any(strcmp(chrom,dict(j).SequenceName))
            clear m
            bam = bamread(file(i).name,dict(j).SequenceName,[1 dict(j).SequenceLength]);
            for k = 1:length(bam)
                m(k).run_id = 'J00171';
                m(k).lane = 1;
                m(k).align_id = 1;
                readID = strsplit(bam(k).QueryName,':');
                m(k).read_id = strjoin(readID(4:7),':');
                tag = bam(k).Tags;
                m(k).align_hi = tag.HI;
                m(k).assembly = 'mm10';
                m(k).assembly_unit = dict(j).SequenceName;
                m(k).align_pos = bam(k).Position;
                m(k).align_flag = bam(k).Flag;
                m(k).align_mapq = bam(k).MappingQuality;
                m(k).align_cigar = bam(k).CigarString;
                m(k).align_nh = tag.NH;
                m(k).align_as = tag.AS;
                m(k).align_nm = tag.nM;
            end
            insert(seq.Alignment,m)
        end
    end
    disp(['Alignments inserted for ' num2str(i) '/' num2str(length(file)) ' cells.'])
end
