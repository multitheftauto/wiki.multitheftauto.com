function onPickupHitShow ( thePlayer )                        -- when someone hits a pickup
	local message = nil                                   -- define the 'message' variable
	local pickupType = getPickupType ( source )           -- get the pickup type and save it to the variable 'pickupType'
	if (pickupType == 0) then                             -- check the type of pickup, if it is a health pickup then...
		amount = getPickupAmount ( source )               -- get the amount of health in the pickup
		message = "You picked up " .. amount .. " health" -- save the message in the 'message' variable
	elseif (pickupType == 1) then                         -- if its a armour pickup then...
		amount = getPickupAmount(source)                  -- get the amount of amour in the pickup
		message = "You picked up " .. amount .. " armor"  -- save the message in the 'message' variable
	elseif (pickupType == 2) then                         -- if its a weapon pickup then..
		local weapon = getPickupWeapon ( source )         -- get the weapon id of the pickup
		local ammo = getPickupAmmo ( source )             -- get the ammo in the pickup
		message = "You picked up " .. getWeaponNameFromID(weapon) .. " with " .. ammo .. " ammo" -- save the message in the 'message' variable
	else
		message = "Unknown pickup type"      -- if it's neither of the above types, set the 'message' variable accordingly
	end
	outputChatBox ( message, thePlayer )             -- output the message to the player in the chatbox
end
addEventHandler ( "onPickupHit", root, onPickupHitShow ) -- add an event handler for onPickupHit