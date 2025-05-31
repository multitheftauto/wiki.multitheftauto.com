function outputPlayerHitByWater(thePed)
	if (getElementType(thePed) ~= "player") then
		return false -- This event is for peds and players but this example only wants players
	end
	local hitPed = getPlayerName(thePed)
	outputChatBox(hitPed.." got hit by a water cannon!", 255, 0, 0)
end
addEventHandler("onClientPedHitByWaterCannon", root, outputPlayerHitByWater)