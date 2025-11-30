function loginPlayer(thePlayer, command, username, password)
    local account = getAccount(username, password) -- Return the account
    if (account) then -- If the account exists.
        logIn(thePlayer, account, password) -- Log them in.
    else
        outputChatBox("Wrong username or password!", thePlayer, 255, 255, 0) -- Output they got the details wrong.
    end
end
addCommandHandler("log-in", loginPlayer) -- Make it trigger for "/log-in", NOTE: /login is hardcored and cannot be used.
