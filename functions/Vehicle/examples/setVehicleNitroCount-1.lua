function infiniteNitro(pPlayer)
	if pPlayer == localPlayer then
		if not getVehicleUpgradeOnSlot(source, 8) then -- Does the vehicle have nitro installed or not
			addVehicleUpgrade(source, 1010) -- Install nitrous
		end
		setVehicleNitroCount(source, 2) -- Make the nitro usable twice
	end
end
addEventHandler("onClientVehicleEnter", root, infiniteNitro)