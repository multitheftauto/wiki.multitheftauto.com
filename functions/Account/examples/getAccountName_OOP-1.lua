function outputOnLogin(previous_account, current_account, auto_login) -- when a player logs in
    outputConsole("[" .. previous_account.id .. "] " .. previous_account.name .." Logged into [" .. current_account.id .. "]" ..current_account.name) -- announce it into the console
end
addEventHandler("onPlayerLogin", root, outputOnLogin) -- add an event handler
