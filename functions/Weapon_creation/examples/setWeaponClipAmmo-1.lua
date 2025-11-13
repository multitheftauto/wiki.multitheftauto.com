function createWeaponWithLowClipAmmo()
	local wep = createWeapon("m4", getElementPosition(localPlayer))
	setWeaponClipAmmo(wep, 1) -- Give the weapon 1 clip ammo, so it will reload at the next shoot.
end
addCommandHandler("weapon", createWeaponWithLowClipAmmo)