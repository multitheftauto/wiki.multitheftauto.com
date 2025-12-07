local connection = dbConnect("sqlite", "test.db")
local queryhandle = dbQuery(connection, 'INSERT INTO Test1 (Name1) VALUES ("Hello"); SELECT * FROM Test1')
local multiResults = dbPoll(queryhandle, -1)

for sid, statementResult in ipairs(multiResults) do
    local resultRows, num_affected_rows, last_insert_id = unpack(statementResult)
    for rid, row in ipairs(resultRows) do
        for column, value in pairs(row) do end
    end
    outputChatBox(sid .. ", " .. num_affected_rows .. ", " .. last_insert_id) -- Shows all statement ids, but only shows affected rows and last insert id
end
