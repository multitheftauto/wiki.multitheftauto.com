function outputOnLogin(previous_account, current_account, auto_login) --when a player logs in
	outputConsole("[" .. getAccountID(previous_account) .. "] " .. getAccountName(previous_account) .. " Logged into ["..getAccountID(current_account) .. "]" .. getAccountName(current_account)) -- announce it into the console
end
addEventHandler("onPlayerLogin", root, outputOnLogin) --add an event handler