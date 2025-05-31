function cancelTearGasChoking(weaponID)
	if (weaponID==17) then
		cancelEvent()
	end
end
addEventHandler("onClientPlayerChoke", getLocalPlayer(), cancelTearGasChoking)