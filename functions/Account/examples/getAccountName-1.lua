function outputOnLogin ( previous_account, current_account, auto_login ) --when a player logs in
	outputConsole(getAccountName(previous_account).." Logged into "..getAccountName(current_account)) -- announce it into the console
end
addEventHandler("onPlayerLogin",root,outputOnLogin ) --add an event handler