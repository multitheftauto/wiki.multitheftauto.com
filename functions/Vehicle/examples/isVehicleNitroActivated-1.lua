local iTickCount

function explodeNitrousVehicle()
	if isPedInVehicle(localPlayer) then -- Check if the player is in a vehicle
		local pVehicle = getPedOccupiedVehicle(localPlayer)
		if pVehicle and getVehicleUpgradeOnSlot(pVehicle, 8) then -- Check if the vehicle has nitrous added in it
			local fVelX, fVelY, fVelZ = getElementVelocity(pVehicle)
			if isVehicleNitroActivated(pVehicle) and fVelX ~= 0 and fVelY ~= 0 and fVelZ ~= 0 then -- Check if the nitro is activated and the vehicle is not moving
				if not iTickCount or getTickCount() - iTickCount > 100 then
					local fX, fY, fZ = getElementPosition(pVehicle)
					createExplosion(fX, fY, fZ, 10, true, -1.0, false) -- Create an explosion in the vehicle
					iTickCount = getTickCount()
				end
			end
		end
	end
end
addEventHandler("onClientRender", root, explodeNitrousVehicle)