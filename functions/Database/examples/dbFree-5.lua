function aaa()
    dbQuery(myCallback, connection, "SELECT * FROM table_name")
end

function myCallback(qh)
    local result = dbPoll(qh, 0) -- Timeout doesn't matter here because the result will always be ready
end
