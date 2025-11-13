function shootProjectile()
	local playerVehicle = getPedOccupiedVehicle(localPlayer)

	if (not playerVehicle) then -- only create projectile if we are inside a vehicle
		return false
	end

	local projectileType = 19 -- rocket
	local vehicleX, vehicleY, vehicleZ = getElementPosition(playerVehicle)

	createProjectile(playerVehicle, projectileType, vehicleX, vehicleY, vehicleZ)
end
bindKey("vehicle_fire", "down", shootProjectile)