function consoleSetPlayerGravity ( thePlayer, commandName, level )
	if thePlayer and level then
		local success = setPedGravity ( thePlayer, tonumber ( level ) )  -- Set the gravity
		if not success then                           -- Check if setPlayerGravity was false (not successful)
			outputConsole( "Failed to set ped gravity", thePlayer )  -- If success is false, meaning gravity could not be set, this message will show
		end
	end
end
addCommandHandler ( "setplayergravity", consoleSetPlayerGravity )