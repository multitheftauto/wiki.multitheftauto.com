local qh = dbQuery( connection, "INSERT INTO table_name VALUES (?,?,?)", "aaa", "bbb", 10 )
dbFree( qh )