addCommandHandler ( "sha", -- Create a command
	function ( thePlayer, command, input )
		if ( input ) then -- Check if the string exist
			local sha256hash = sha256( input ) -- Generate the hash
			outputChatBox( sha256hash ) -- Output the hash in the chat
		end
	end
)