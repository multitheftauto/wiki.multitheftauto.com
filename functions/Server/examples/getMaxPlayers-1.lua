function showPlayers()
	outputChatBox("There are "..getPlayerCount().."/"..getMaxPlayers().." players playing.",source) --output a message to the joined player informing the player count and max players.
end
addEventHandler("onPlayerJoin",root,showPlayers) --Add an event handler to call the function when a player joins.