addCommandHandler ( "keycommands",
	function ( commandName, theKey, keyState )
		if ( theKey and keyState ) then -- We check if theKey and keyState is valid.
			local commands = getCommandsBoundToKey ( theKey, keyState )
			if ( commands and type ( commands ) == "table" ) then
				for command, state in pairs ( commands ) do
					outputChatBox ( command )
				end
			end
		else
			outputChatBox (	commandName ..": Correct syntax: [ theKey ] [ keyState ]" )
		end
	end
)