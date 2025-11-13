function consoleSetFightingStyle ( thePlayer, commandName, id )
	if thePlayer and id then                                                     -- If player and ID are specified
		local status = setPedFightingStyle ( thePlayer, tonumber(id) )       -- set the fighting style
		if not status then                                                   -- if that failed
			outputConsole ( "Failed to set fighting style.", thePlayer ) -- show a message
		end
	end
end
addCommandHandler ( "setstyle",  consoleSetFightingStyle )