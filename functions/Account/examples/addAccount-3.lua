local bRegisteredOnce = {}

function registerPlayer(source, commandName, username, password)
    if ((password and #password > 0) and (username and #username > 0) and not bRegisteredOnce[source]) then
        local accountAdded = addAccount(username, password)
        if (accountAdded) then
            outputChatBox("Thank you " .. getPlayerName(source) ..", you're now registed, you can login with /login", source)
            bRegisteredOnce[source] = true
        else
            outputChatBox("Error creating account, contact the server admin.", source)
        end
    else
        if (bRegisteredOnce[source]) then
            outputChatBox("You already registered on this server!", source)
        else
            outputChatBox("Error creating account, correct syntax: /register <nick> <pass>", source)
        end
    end
end
