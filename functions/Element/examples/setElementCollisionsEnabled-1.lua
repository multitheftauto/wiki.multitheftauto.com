function disableVehicleCollisionsNearPlayer(thePlayer, maxDistance)
	local playerX, playerY, playerZ = getElementPosition(thePlayer)
	local vehicles = getElementsByType("vehicle")
	for k,v in ipairs(vehicles) do
		local vehicleX, vehicleY, vehicleZ = getElementPosition(v)
		-- get the distance between the player and the vehicle:
		local distance = getDistanceBetweenPoints3D(vehicleX, vehicleY, vehicleZ, playerX, playerY, playerZ)
		if (distance <= maxDistance) then
			-- disable collisions for the vehicle
			setElementCollisionsEnabled(v, false)
		end
	end
end