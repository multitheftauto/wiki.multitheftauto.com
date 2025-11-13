function outputOnLogin ( previous_account, current_account, auto_login ) --when a player logs in
	outputDebugString(source.name .. " logged into his account with IP " .. current_account.ip) -- announce it into the debugscript
end
addEventHandler("onPlayerLogin", root, outputOnLogin) --add an event handler