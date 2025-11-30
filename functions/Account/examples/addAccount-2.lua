function registerPlayer(source, commandName, username, password)
    if (username and #username > 0 and password and #password > 0) then
        local accountAdded = addAccount(username, password)
        if (accountAdded) then
            outputChatBox("Thank you " .. getPlayerName(source) ..", you're now registed, you can login with /login", source)
        else
            outputChatBox("Error creating account, contact the server admin.", source)
        end
    else
        outputChatBox("Error creating account, correct syntax: /register <nick> <pass>", source)
    end
end
addCommandHandler("register", registerPlayer) -- add the command handler
