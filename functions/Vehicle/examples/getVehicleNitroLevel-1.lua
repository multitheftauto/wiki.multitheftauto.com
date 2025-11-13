function displayNitroLevel(pPlayer)
	if pPlayer == localPlayer then
		if getVehicleUpgradeOnSlot(source, 8) then -- Check if the vehicle has nitro installed
			local fNitroLevel = getVehicleNitroLevel(source)
			outputChatBox("The nitro level of this " .. getVehicleName(source) .. " is " .. fNitroLevel .. ".", 255, 180, 20, false)
		end
	end
end
addEventHandler("onClientVehicleEnter", root, displayNitroLevel)