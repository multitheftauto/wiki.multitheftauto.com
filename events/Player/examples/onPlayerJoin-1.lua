-- we register greetPlayer as a handler for the event
function greetPlayer ( )
	-- we store the player's name
	local joinedPlayerName = getPlayerName ( source )
	local serverName = getServerName( )
	-- and send him a greeting
	outputChatBox ( "Welcome " .. joinedPlayerName .. " to ".. serverName .."!" , source, 255, 255, 255 )
end
addEventHandler ( "onPlayerJoin", root, greetPlayer )