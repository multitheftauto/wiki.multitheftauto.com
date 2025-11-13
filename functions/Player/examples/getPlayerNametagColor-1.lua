function tagInfoCommand ( thePlayer, commandName )
	-- store the RGB data about the player who activated the command handler into the local variables r, g, b. 
	local r, g, b = getPlayerNametagColor ( thePlayer )
	-- Display the RGB values in the chatbox
	outputChatBox ( "Your tag color is: R:" .. r .. " G:" .. g .. " B:" .. b, thePlayer )
end
addCommandHandler ( "retrievetagcolor", tagInfoCommand )