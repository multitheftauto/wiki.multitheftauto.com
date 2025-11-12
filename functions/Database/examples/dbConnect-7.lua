test_db = dbConnect( "sqlite", "file.db" )

if test_db then
    outputDebugString( "Connection with database was successfully established." )
else
    outputDebugString( "Connection with database couldn't be established." )
end