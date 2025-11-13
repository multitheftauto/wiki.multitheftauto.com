function locatePlayer( sourcePlayer, command, who )
	local targetPlayer = getPlayerFromName ( who )                -- find the player that was specified in the command
	if ( targetPlayer ) then                                      -- if a player was found
		local x,y,z = getElementPosition ( sourcePlayer )     -- save the position of the player who entered the command
		local xp,yp,zp = getElementPosition ( targetPlayer )  -- save the position of the player who should be located
		local dir = nil
		if (yp > y) then
			dir = "N"
		else
			dir = "S"
		end
		if (xp > x) then
			dir = dir .. "E"
		else
			dir = dir .. "W"
		end
		local distance = math.ceil ( getDistanceBetweenPoints3D(x, y, z, xp, yp, zp) )
		outputChatBox( who .. " found " .. dir .. " (" .. distance .. ")", sourcePlayer) -- output the message
	end
end
addCommandHandler ( "locate", locatePlayer )