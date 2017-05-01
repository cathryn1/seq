cd /Users/cathryn/Dropbox/'Microcolumn Patch-seq data'/

fileID = fopen('rna.txt');
data = textscan(fileID,'%s','Delimiter','\n');
data2 = strjoin(data{1}(:),'');
gi = extractBetween(data2,'>gi|','|ref');
transcID = extractBetween(data2,'ref|','| ');

count = 0;
for i = 1:length(data{1})
    if ~isempty(strfind(data{1}{i},'>gi'))
        idx = strfind(data{1}{i},'| ');
        count = count + 1;
        m(count).transc_name = data{1}{i}(idx:end);
        m(count).transc_seq = '';
    else
        m(count).transc_seq = [m(count).transc_seq data{1}(i)];
        disp([num2str(count) '/' num2str(length(gi)) ' concatenated'])
    end
end

for i = 1:length(m)
    m(i).transc_seq = strjoin(m(i).transc_seq,'');
end

for i = 1:length(gi)
    m(i).transc_gi = str2num(gi{i});
    m(i).annotation_db = 'RefSeq';
    m(i).version = 1;
    m(i).transc_id = transcID{i};
    insert(seq.Transcript,m(i))
    disp([num2str(i) '/' num2str(length(gi)) ' inserted'])
end