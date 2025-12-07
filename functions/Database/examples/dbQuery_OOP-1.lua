local qh = connection:query("INSERT INTO table_name VALUES (?,?,?)", "aaa", "bbb", 10)
qh:free()
