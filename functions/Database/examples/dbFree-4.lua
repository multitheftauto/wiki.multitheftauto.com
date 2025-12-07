local qh = dbQuery(connection, "SELECT * FROM table_name")
local result = dbPoll(qh, -1) -- Wait until result has been gotten
