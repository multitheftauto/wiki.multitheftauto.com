local chatRadius = 20 -- define our chat radius

function onPlayerChatSendMessageToNearbyPlayers(messageText, messageType)
	local normalMessage = (messageType == 0) -- we will only send normal chat messages, action and team types will be ignored

	if (not normalMessage) then -- it's not normal message
		return false -- do not continue
	end

	local playerName = getPlayerName(source)
	local playerX, playerY, playerZ = getElementPosition(source) -- get position of player who sent the message
	local playerInterior = getElementInterior(source) -- get interior of same player
	local playerDimension = getElementDimension(source) -- dimension as well
	local nearbyPlayers = getElementsWithinRange(playerX, playerY, playerZ, chatRadius, "player", playerInterior, playerDimension) -- get nearby players within given radius
	local messageToOutput = playerName..": "..messageText

	outputChatBox(messageToOutput, nearbyPlayers, 255, 255, 255, true) -- output message to them
	cancelEvent() -- block the original message by cancelling this event
end
addEventHandler("onPlayerChat", root, onPlayerChatSendMessageToNearbyPlayers)