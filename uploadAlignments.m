%% First copy the data into a local folder
cd /Users/cathryn/sandberglab/pipeline3.0/rnaseq/mmu/PatchSeqColumns/star_mm10/

dirs = dir([cd '/170406*']);

for i = 88:length(dirs) % come back and do # 87, I think it was skipped
    file = [dirs(i).name '/' dirs(i).name '_unique.bam'];
    [status,msg,msgID] = copyfile(file,'/Users/cathryn/Dropbox/Microcolumn Patch-seq data/star_mm10');
    disp([num2str(i) '/' num2str(length(dirs)) ' .bam files copied.'])
end
    
%%

cd /Users/cathryn/Dropbox/'Microcolumn Patch-seq data'/star_mm10/



%fileID=fopen(file.name);
    %infoStruct = baminfo(file.name,'ScanDictionary',true,'NumOfReads',true);
  