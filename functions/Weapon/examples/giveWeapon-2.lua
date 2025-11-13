function consoleGive ( thePlayer, commandName, weaponID, ammo )
	local status = giveWeapon ( thePlayer, weaponID, ammo, true )   -- attempt to give the weapon, forcing it as selected weapon
	if ( not status ) then                                          -- if it was unsuccessful
		outputConsole ( "Failed to give weapon.", thePlayer )   -- tell the player
	end
end
addCommandHandler ( "give", consoleGive )