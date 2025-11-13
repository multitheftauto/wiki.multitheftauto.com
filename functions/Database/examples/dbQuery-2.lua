local qh = dbQuery( connection, "SELECT * FROM table_name" )
local result = dbPoll( qh, -1 )