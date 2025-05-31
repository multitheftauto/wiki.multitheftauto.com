local weaponsToBlock = {
	[38] = true, -- minigun
}

function onPlayerWeaponSwitch(previousWeaponID, currentWeaponID)
	local blockFire = (not weaponsToBlock[currentWeaponID]) -- reverse bool, true/worthy will give us false, and false/unworthy will give us true

	toggleControl(source, "fire", blockFire) -- toggle player control to fire weapon
end
addEventHandler("onPlayerWeaponSwitch", root, onPlayerWeaponSwitch)