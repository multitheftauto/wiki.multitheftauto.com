function forceMapForPlayer ( callingPlayer, command, whoNick )
	local who = getPlayerFromName ( whoNick )                                   -- Look up the specified player
	if ( who ) then
		if ( not isPlayerMapForced ( who ) ) then                           -- if their map isn't already forced on
			forcePlayerMap ( who, true )                                -- force it on
			setTimer ( forcePlayerMap, 10000, 1, who, false )           -- force it off in 10secs
			outputChatBox ( "Forcing Map for " .. whoNick, callingPlayer ) -- output a message to the one who entered the command
		else
			outputChatBox ( "Map already forced for " .. whoNick, callingPlayer ) -- if the map is already forced, output a message
		end
	else
		outputChatBox ( "Couldn't find " .. whoNick, callingPlayer )        -- if the player wasn't found, output a message
	end
end
addCommandHandler ( "forcemap", forceMapForPlayer ) -- add a command handler