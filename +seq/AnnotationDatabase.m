%{
# Transcript annotation databases 
annotation_db: varchar(20) # name of annotation database
version: tinyint unsigned  # version number of annotation database
-----
annotation_update=null: date  # date anntotations were updated for current version
%}

classdef AnnotationDatabase < dj.Lookup
    methods
        function fill(self)
            self.inserti({
                'RefSeq' 1 '2017-04-27'
                'Ensembl' 1 ''
            })
        end
    end
end