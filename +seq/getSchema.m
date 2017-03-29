function obj = getSchema
persistent schemaObject
if isempty(schemaObject)
    schemaObject = dj.Schema(dj.conn, 'seq', 'seq_seq');
end
obj = schemaObject;
end
