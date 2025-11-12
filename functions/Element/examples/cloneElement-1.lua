function cloneVehicle ( thePlayer, commandName )
	local occupiedVehicle = getPedOccupiedVehicle ( thePlayer ) -- get the player's vehicle
	if occupiedVehicle then -- If the player is actually in a vehicle
		local x, y, z = getElementPosition ( occupiedVehicle )   -- get the vehicle's position
		local clone = cloneElement ( occupiedVehicle, x+5, y, z ) -- create a clone of the vehicle near it
	else
		outputChatBox ( "You can't clone a vehicle if you're not in a vehicle", thePlayer, 255, 0, 0 )
	end
end
addCommandHandler ( "clone", cloneVehicle )