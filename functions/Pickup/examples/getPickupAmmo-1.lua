function onPickupHitFunction ( thePlayer )
	if getPickupType ( source ) ~= 2 then return end   -- if the pickup is no weapon, stop
	local ammo = getPickupAmmo ( source )              -- get the amount of ammo
	local weapon = getPickupWeapon ( source )          -- get the weapon of the pickup
	outputChatBox ( "You just picked up a " .. getWeaponNameFromID(weapon) .. " with " .. ammo .. " ammo", thePlayer ) -- output a message to the player
end
addEventHandler ( "onPickupHit", root, onPickupHitFunction ) -- add an event handler for onPickupHit