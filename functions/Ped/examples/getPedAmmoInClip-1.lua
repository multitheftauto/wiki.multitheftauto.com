function showAmmo(thePlayer, command, who )
	local targetPlayer = getPlayerFromName ( who )
	if ( thePlayer ) then
		local ammo = getPedAmmoInClip ( targetPlayer )
		outputChatBox ( who .. " has " .. ammo .. " ammo in his active clip" )
	else
		outputChatBox ( "Player '" .. who .. "' not found." )
	end
end
addCommandHandler( "ammo", showAmmo )