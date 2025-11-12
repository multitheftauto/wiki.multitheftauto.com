function toggleNametag ( sourcePlayer, command, who )
	local tplayer = sourcePlayer                   -- by default, toggle the name tag of the player who issued the command
	if ( who ) then                                -- if there was a nick entered in the command
		tplayer = getPlayerFromName ( who )    -- search for the player
	else
		whoNick = getPlayerName(sourcePlayer)
	end
	if ( tplayer ~= false ) then                                -- if the player was found (or no playername was entered)
		if isPlayerNametagShowing ( tplayer ) then          -- if the nametag is shown
			setPlayerNametagShowing ( tplayer, false )  -- hide it
			outputChatBox ( who .. "'s nametag is now hidden", sourcePlayer )  -- output a message to the player who entered the command
		else                                                -- if the nametag is not shown
			setPlayerNametagShowing ( tplayer, true )   -- show it
			outputChatBox ( who .. "'s nametag is now showing", sourcePlayer ) -- output a message to the player who entered the command
		end
	else
		outputChatBox ( "Player not found.", sourcePlayer )
	end
end
addCommandHandler ( "toggleNametag", toggleNametag )