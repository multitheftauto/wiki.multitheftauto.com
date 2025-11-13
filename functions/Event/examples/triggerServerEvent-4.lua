function onServerSendTable(sentTable)
	if (not client) then -- 'client' points to the player who triggered the event, and should be used as security measure (in order to prevent player faking)
		return false -- if this variable doesn't exists at the moment (for unknown reason, or it was the server who triggered this event), stop code execution
	end

	local matchingSource = (source == resourceRoot) -- check whether source element (2nd argument in triggerServerEvent) passed from client was resourceRoot

	if (not matchingSource) then -- apparently it wasn't
		return false -- so do not process this event
	end

	local dataType = type(sentTable) -- check type of data coming from client
	local dataTable = (dataType == "table") -- check whether it's table

	if (not dataTable) then -- if it isn't table
		return false -- stop our code here
	end

	local minTableLength = 1 -- min allowed length of table
	local maxTableLength = 3 -- max allowed length of table
	local tableLength = (#sentTable) -- get table length
	local matchingTableLength = (tableLength >= minTableLength and tableLength <= maxTableLength) -- verify whether length is allowed

	if (not matchingTableLength) then -- if table length was exceeded
		return false -- tell server to stop here
	end

	local numbersOnly = true -- variable which will hold whether numbers only were in the table

	for _, numberValue in pairs(sentTable) do -- iterate through table 
		local valueType = type(numberValue) -- check type of each data
		local numberType = (valueType == "number") -- check whether it's a number

		if (not numberType) then -- it isn't a number
			numbersOnly = false -- since at least one of data inside isn't number, set it to false
			break -- break the loop, no need to check further
		end
	end

	if (not numbersOnly) then -- it isn't numbers only table
		return false -- stop code execution
	end

	local playerName = getPlayerName(client) -- get name of player who sent message
	local sentNumbers = table.concat(sentTable, ", ") -- convert our table into list of numbers separated by comma
	local chatMessage = playerName.." sent table with numbers from client: "..sentNumbers

	outputChatBox(chatMessage, root, 255, 255, 255, false) -- output numbers sent from client-side for everyone on server

	-- useful utility for checking event data: https://wiki.multitheftauto.com/wiki/Script_security
end
addEvent("onServerSendTable", true) -- 2nd argument should be set to true, in order to be triggered from counter side (in this case client-side)
addEventHandler("onServerSendTable", resourceRoot, onServerSendTable)