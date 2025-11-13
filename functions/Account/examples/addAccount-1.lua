function registerPlayer ( source, commandName, password )
	-- Check if the password field is blank or not (only blank if they didnt enter one)
	if ( password ~= "" and password ~= nil ) then
		--Attempt to add the account, and save its value in a var
		local accountAdded = addAccount( getPlayerName(source), password )
		if ( accountAdded ) then
			--  Tell the user all is done
			outputChatBox ( "Thank you " .. getPlayerName(source) .. ", you're now registed, you can login with /login", source )
		else
			-- There was an error making the account, tell the user
			outputChatBox ( "Error creating account, contact the server admin", source )
		end
	else
		-- There was an error in the syntax, tell the user the correct syntax.
		outputChatBox ( "Error creating account, correct syntax: /register <password>", source )
	end
end
addCommandHandler ( "register", registerPlayer ) -- add the command handler