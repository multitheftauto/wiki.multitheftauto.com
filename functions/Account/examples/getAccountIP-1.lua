function outputOnLogin(previous_account, current_account, auto_login) -- when a player logs in
    outputDebugString(getPlayerName(source) .." logged into his account with IP " ..getAccountIP(current_account)) -- announce it into the debugscript
end
addEventHandler("onPlayerLogin", getRootElement(), outputOnLogin) -- add an event handler
