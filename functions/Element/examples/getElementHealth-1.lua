function showLocalHealth()
	-- get the player's health and output it
	local playerHealth = getElementHealth ( localPlayer )
	outputChatBox ( "Your health: " .. playerHealth )

	-- get the player's vehicle: if he is in one, output its health as well
	local playerVehicle = getPedOccupiedVehicle ( localPlayer )
	if playerVehicle then
		local vehicleHealth = getElementHealth ( playerVehicle ) / 10  -- Divide this by 10, as default the denominator is 1000
		outputChatBox ( "Your vehicle's health: " .. vehicleHealth )
	end
end
addCommandHandler ( "showhealth", showLocalHealth )