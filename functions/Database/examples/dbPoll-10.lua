local dbConnection = dbConnect("sqlite", "sql.db")
local playerName = "testPlayer"

function onServerQueryCallback(queryHandler, extraData)
	local queryResult = dbPoll(queryHandler, 0)
	local validResult = type(queryResult) == "table"

	outputDebugString("Extra data which have been passed through dbQuery:", extraData)

	if not validResult then
		outputDebugString("Result ~= table")

		return false
	end

	outputDebugString("Query results:", queryResult)
end

dbQuery(onServerQueryCallback, {"Some data"}, dbConnection, "SELECT * FROM `Players` WHERE `playerName` = ?", playerName)