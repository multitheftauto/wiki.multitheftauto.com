function getMoveState( command, playerName )
-- If the player name exists we will have our 'player'
	local player = getPlayerFromName( playerName )
	-- If the player does not exist, the script will stop.
	if not player then 
		outputChatBox( "No player named " .. playerName .. " was found.", 250, 0, 0, true )
		return false
	end
	-- If we found the player from the name, we can get his movestate.
	local moveState = getPedMoveState( player )
	-- If a player and a movestate is found, the script will output it to the chatbox.
	outputChatBox( playerName .. "'s current moveState is: " .. moveState, 0, 150, 0, true )
end
addCommandHandler( "getMoveState", getMoveState ) -- To execute this command, simply write: /getMoveState playerName