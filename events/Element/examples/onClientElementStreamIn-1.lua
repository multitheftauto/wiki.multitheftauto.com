function onClientElementStreamIn()
	local validElement = isElement(source)

	if (not validElement) then
		return false
	end

	local elementType = getElementType(source)
	local playerType = (elementType == "player")

	if (not playerType) then
		return false
	end

	local pedDead = isPedDead(source)

	if (pedDead) then
		return false
	end

	local localX, localY, localZ = getElementPosition(localPlayer)
	local playerX, playerY, playerZ = getElementPosition(source)
	local distanceBetweenPlayers = getDistanceBetweenPoints3D(localX, localY, localZ, playerX, playerY, playerZ)

	outputChatBox("A player has just streamed in. Distance to the player: "..distanceBetweenPlayers)
end
addEventHandler("onClientElementStreamIn", root, onClientElementStreamIn)