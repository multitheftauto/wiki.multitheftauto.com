function disableMinigunOnSwitch(prevSlot, curSlot)
	if getPedWeapon(localPlayer, curSlot) == 38 then --if the switched weapon is the minigun
		toggleControl("aim_weapon", false) --disable the aim button
	else --if it isnt the minigun
		toggleControl("aim_weapon", true) --renable the aim button
	end
end
addEventHandler("onClientPlayerWeaponSwitch", localPlayer, disableMinigunOnSwitch)