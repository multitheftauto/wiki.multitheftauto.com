function drawNitroCounts()
	local fCamX, fCamY, fCamZ = getCameraMatrix()
	for _, v in ipairs(getElementsByType("vehicle")) do
		if getVehicleUpgradeOnSlot(v, 8) then -- Check if the vehicle has nitro installed
			local fX, fY, fZ = getElementPosition(v)
			local fCamX, fCamY, fCamZ = getCameraMatrix()
			local fX2, fY2 = getScreenFromWorldPosition(fX, fY, fZ + 0.85, 0.08)
			if fX2 then
				local fDistance = getDistanceBetweenPoints3D(fX, fY, fZ, fCamX, fCamY, fCamZ)
				if fDistance < 60 then
					if isLineOfSightClear(fCamX, fCamY, fCamZ, fX, fY, fZ, true, false, false, true, false) then
						local pVehicle = getPedOccupiedVehicle(localPlayer)
						if not pVehicle or pVehicle ~= v then
							local fScale = (60 / fDistance) * 0.7
							local iNitroCount = getVehicleNitroCount(v)
							dxDrawText("Nitro count: " .. iNitroCount, fX2 + 1, fY2 + 1, fX2 + 1, fY2 + 1, tocolor(0, 0, 255), fScale, "default", "center", "bottom")
							dxDrawText("Nitro count: " .. iNitroCount, fX2, fY2, fX2, fY2, tocolor(255, 255, 255), fScale, "default", "center", "bottom")
						end
					end
				end
			end
		end
	end
end
addEventHandler("onClientRender", root, drawNitroCounts)