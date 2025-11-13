function logClientLogin ( previous_account, current_account )
	outputServerLog ( "Client " .. getPlayerName ( source ) .. " logged in as " .. getAccountName ( current_account ) )
end
addEventHandler ( "onPlayerLogin", root, logClientLogin )