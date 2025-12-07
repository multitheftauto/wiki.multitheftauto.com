local test_db = Connection("sqlite", "file.db")

if test_db then
    outputDebugString("Connection with database was successfully established.")
else
    outputDebugString("Connection with database couldn't be established.")
end
