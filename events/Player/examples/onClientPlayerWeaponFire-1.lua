function playGunfireSound(weaponID)
	local muzzleX, muzzleY, muzzleZ = getPedWeaponMuzzlePosition(source)
	local dim = getElementDimension(source)
	local int = getElementInterior(source)
	setAmbientSoundEnabled ("gunfire", false)

	local weaponSounds = {
		[22] = "sounds/weap/colt45.ogg",
		[23] = "sounds/weap/silenced.ogg",
		[24] = "sounds/weap/deagle.ogg",
		[25] = "sounds/weap/shotgun.ogg",
		[26] = "sounds/weap/sawed-off.ogg",
		[27] = "sounds/weap/combat shotgun.ogg",
		[28] = "sounds/weap/uzi.ogg",
		[30] = "sounds/weap/ak-47.ogg",
		[31] = "sounds/weap/m4.ogg",
		[32] = "sounds/weap/tec9.ogg",
		[34] = "sounds/weap/sniper.ogg",
	}

	if weaponSounds[weaponID] then
		sound = playSound3D(weaponSounds[weaponID], muzzleX, muzzleY, muzzleZ)
		setSoundMaxDistance(sound, 90)
		setElementDimension(sound, dim)
		setElementInterior(sound, int)
		setSoundVolume(sound, 0.6)
	end
end
addEventHandler("onClientPlayerWeaponFire", root, playGunfireSound)