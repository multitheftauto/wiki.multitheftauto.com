function commitSuicide ( sourcePlayer )
	-- kill the player and make him responsible for it
	killPed ( sourcePlayer, sourcePlayer )
end
-- attach our handler to the "kill" command
addCommandHandler ( "kill", commitSuicide )