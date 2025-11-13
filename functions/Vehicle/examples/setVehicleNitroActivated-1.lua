function activateNitro(pPlayer)
	if pPlayer == localPlayer then
		if not getVehicleUpgradeOnSlot(source, 8) then -- Check if the vehicle has nitro installed or not
			addVehicleUpgrade(source, 1010) -- Install the nitrous
		end
		setVehicleNitroActivated(source, true) -- Activate the nitro
	end
end
addEventHandler("onClientVehicleEnter", root, activateNitro) -- When the player enters a vehicle, it executes the function