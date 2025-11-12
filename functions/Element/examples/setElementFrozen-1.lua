function toggleFreezeStatus(thePlayer) -- This function freezes the specified player's vehicle, if he's in one
	local playerVehicle = getPedOccupiedVehicle(thePlayer) -- Check if player's in vehicle

	if playerVehicle then -- if so
		local isPlayerVehicleFrozen = isElementFrozen(playerVehicle) -- Check if vehicle is frozen

		setElementFrozen(playerVehicle, not isPlayerVehicleFrozen) -- Set opposite state
	end
end

local connectedPlayers = getElementsByType("player") -- Get all connected players

for playerID = 1, #connectedPlayers do -- Loop through each player
	local playerElement = connectedPlayers[playerID] -- Get player element by accessing it via playerID

	bindKey(playerElement, "p", "down", toggleFreezeStatus, "Toggle freeze status") -- Bind function for player
end