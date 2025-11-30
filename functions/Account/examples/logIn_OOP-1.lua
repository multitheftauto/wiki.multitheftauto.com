function loginPlayer(thePlayer, command, username, password)
    local account = Account(username, password) -- Return the account
    if (account) then -- If the account exists.
        thePlayer:logIn(account, password) -- Log them in.
    else
        thePlayer:outputChat("Wrong username or password!", 255, 255, 0) -- Output they got the details wrong.
    end
end
addCommandHandler("log-in", loginPlayer) -- Make it trigger for "/log-in", NOTE: /login is hardcored and cannot be used.
