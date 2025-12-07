local qh = dbQuery(connection, "SELECT * FROM table_name")
local result = dbPoll(qh, 10) -- Get result with a timeout of 10ms
if result == nil then
    result = dbPoll(qh, 10) -- Try again to get result with a timeout of 10ms
    if result == nil then
        dbFree(qh) -- Give up
    end
end
