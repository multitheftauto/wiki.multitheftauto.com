local chatColors = {} -- Create a table to save the color

function onPlayerJoin()
	-- Create a table to add rgb values, index will be the player element

	chatColors[source] = {math.random(50, 255), math.random (50, 255), math.random (50, 255)}
end
addEventHandler("onPlayerJoin", root, onPlayerJoin)

function onPlayerChat(playerMessage, messageType)
	local normalMessage = messageType == 0

	if not normalMessage then
		return false -- If it's not normal type message, cancel code execution
	end

	local playerName = getPlayerName(source) -- Get player name
	local playerColors = chatColors[source] -- Get player stored colors
	local colorR, colorG, colorB = playerColors[1], playerColors[2], playerColors[3] -- Store them into different variables

	outputChatBox(playerName..": #E0D0B0"..playerMessage, root, colorR, colorG, colorB, true) -- Output our message
	cancelEvent()
end
addEventHandler("onPlayerChat", root, onPlayerChat)

function onPlayerQuit()
	chatColors[source] = nil -- Clear stored data to avoid memory leaks
end
addEventHandler("onPlayerQuit", root, onPlayerQuit)