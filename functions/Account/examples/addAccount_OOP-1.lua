function registerPlayer(source, commandName, password)
    -- Check if the password field is blank or not (only blank if they didnt enter one)
    if (password and #password > 0) then
        -- Attempt to add the account, and save its value in a var
        local accountAdded = Account.add(source.name, password)
        if (accountAdded) then
            --  Tell the user all is done
            source:outputChat("Thank you " .. source.name ..", you're now registed, you can login with /login")
        else
            -- There was an error making the account, tell the user
            source:outputChat("Error creating account, contact the server admin")
        end
    else
        -- There was an error in the syntax, tell the user the correct syntax.
        source:outputChat("Error creating account, correct syntax: /register <password>")
    end
end
addCommandHandler("register", registerPlayer) -- add the command handler
