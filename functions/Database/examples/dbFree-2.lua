function aaa()
    dbQuery(myCallback, connection, "SELECT * FROM table_name")
end

function myCallback(qh)
    dbFree(qh)
end
