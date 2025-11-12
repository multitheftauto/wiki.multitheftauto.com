local dbConnection = dbConnect("sqlite", "test.db")
local queryHandle = dbQuery(dbConnection, "SELECT * FROM `Test1`")
local queryResult = dbPoll(queryHandle, -1)
	
for rowID, rowData in ipairs(queryResult) do

	for columnName, columnValue in pairs(rowData) do
		outputChatBox(columnName..", "..columnValue)
	end
end