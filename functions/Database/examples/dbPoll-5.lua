local connection = dbConnect("sqlite", "test.db")
local queryhandle = dbQuery(connection, 'SELECT * FROM Test1')
local result = dbPoll(queryhandle, -1)

for rid, row in ipairs(fromJSON(toJSON(result))) do -- row represents the tables that are in 'result', which represent the rows
    for column, value in pairs(row) do -- column represents column name, value represents column value
        outputChatBox(column .. ', ' .. value)
    end
end
