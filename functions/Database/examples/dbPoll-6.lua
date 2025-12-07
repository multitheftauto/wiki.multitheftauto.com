local connection = dbConnect("sqlite", "test.db")
local queryhandle = dbQuery(connection, 'INSERT INTO Test1 ("Name1", "Name2") VALUES ("Hello", "Hi");')
local result = dbPoll(queryhandle, -1)

outputChatBox(toJSON(result)) -- Shows only rowid 1 affected because we only used INSERT INTO statement and not a SELECT statement.

queryhandle = nil -- Making the query handle and result to nil
result = nil

queryhandle = dbQuery(connection, 'SELECT * FROM Test1;')
result = dbPoll(queryhandle, -1)
outputChatBox(toJSON(result)) -- Now shows rowid 2 affected.
