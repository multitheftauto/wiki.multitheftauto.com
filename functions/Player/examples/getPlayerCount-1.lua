function playerCount ( )
	outputChatBox ( "There are now " .. getPlayerCount() .. " players on this server!" )
end
addEventHandler ( "onPlayerJoin", root, playerCount )
addEventHandler ( "onPlayerQuit", root, playerCount )