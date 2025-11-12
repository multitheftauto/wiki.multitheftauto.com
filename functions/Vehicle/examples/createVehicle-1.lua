local vehMark = createMarker(-2426.34106, -639.12714, 132.93631,"cylinder")

function vehicleSpawner(hitElement,matchingDimension)
	if getElementType(hitElement) == "player" then
		if getPedOccupiedVehicle(hitElement) == false then
		local x,y,z = getElementPosition(hitElement)
			local veh = createVehicle(551, x,y,z)
			warpPedIntoVehicle(hitElement,veh)
		end
	end 
end 
addEventHandler("onMarkerHit",vehMark,vehicleSpawner)