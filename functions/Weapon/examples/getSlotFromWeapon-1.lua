function outputWeaponSlot ( source, commandName, weaponID )
	local weaponSlot = getSlotFromWeapon ( weaponID )
	
	if (weaponSlot) then
	    outputChatBox ( "Weapon ID " .. weaponID ..  " is in weapon slot " .. weaponSlot)
	else
	    outputChatBox ( "Invalid weapon ID" )
	end
end
addCommandHandler ( "getWeaponSlot", outputWeaponSlot )