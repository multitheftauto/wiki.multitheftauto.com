function changeNitroLevel(pPlayer)
	if pPlayer == localPlayer then
		if not getVehicleUpgradeOnSlot(source, 8) then -- Check if the vehicle has nitro in it or not
			addVehicleUpgrade(source, 1010) -- Install nitrous
		end
		setVehicleNitroLevel(source, 0.1) -- Set a nitro level of 0.1 to the vehicle
	end
end
addEventHandler("onClientVehicleEnter", root, changeNitroLevel)