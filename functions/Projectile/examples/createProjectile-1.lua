function onClientPlayerWeaponFire(weaponID, weaponAmmo, weaponAmmoInClip, hitX, hitY, hitZ, hitElement)
	local minigunWeapon = (weaponID == 38) -- check if player is using minigun

	if (not minigunWeapon) then
		return false -- he doesn't, so don't continue
	end

	local playerX, playerY, playerZ = getElementPosition(source) -- get position of player
	local projectileType = 19 -- type of projectile
	local projectileForce = 200 -- force used for projectile
	local rocketProjectile = createProjectile(source, projectileType, playerX, playerY, playerZ, projectileForce) -- create rocket projectile

	if (not rocketProjectile) then -- if projectile limit is reached
		outputChatBox("Rocket minigun overheated! Give it a rest pal!", source) -- output a message
	end
end
addEventHandler("onClientPlayerWeaponFire", localPlayer, onClientPlayerWeaponFire)