-- we create our handler function, where sourcePlayer is the player who sent the command,
-- and checkedPlayerName is the player name specified.
function outputIsInVehicle ( sourcePlayer, commandName, checkedPlayerName )
	-- we get the player element from the nick specified
	local checkedPlayer = getPlayerFromName ( checkedPlayerName )
	-- if there exists a player with that nick
	if ( checkedPlayer ) then
		-- if he's in a vehicle,
		if isPedInVehicle ( checkedPlayer ) then
			-- tell the source player
			outputChatBox ( checkedPlayerName .. " is in a vehicle.", sourcePlayer )
		-- if he's not in a vehicle,
		else
			-- tell the source player
			outputChatBox ( checkedPlayerName .. " is not in a vehicle.", sourcePlayer )
		end
	-- if it doesn't exist,
	else
		-- tell the source player
		outputChatBox ( "Invalid player name.", sourcePlayer )
	end
end

-- define a handler for the isinvehicle command
addCommandHandler ( "isinvehicle", outputIsInVehicle )