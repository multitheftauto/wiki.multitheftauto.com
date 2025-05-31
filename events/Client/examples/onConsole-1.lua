function input_Console ( text ) --when a player types in the console
	-- if it's an ingame player,
	if ( getElementType ( source ) == "player" ) then
		--split the command by spaces (ASCII 32) and get the first piece of text
		local command = gettok ( text, 1, 32 )
		--if the first piece of text was "yo",
		if ( command == "yo" ) then
			--get the player's name
			local playerName = getPlayerName ( source )
			-- get the action text by substracting the first three characters ("yo ")
			local actionText = string.sub ( text, 3 )
			-- announce the yo command into the chatbox
			outputChatBox ( "* " .. playerName .. " " .. actionText, getRootElement(), 255, 255, 0 )
		end
	end
end
addEventHandler ( "onConsole", getRootElement(), input_Console ) -- add an event handler for onConsole