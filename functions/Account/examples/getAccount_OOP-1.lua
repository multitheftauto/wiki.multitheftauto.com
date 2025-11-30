addCommandHandler("checkaccount", function(player, cmd, account)
    if ACL.hasObjectPermissionTo(player, "function.banPlayer") then -- if the player typing /checkaccount command has permission to banPlayer
        if (account and account ~= "") then -- if the account name was mentioned
            if (Account(account)) then -- if the account exists
                player:outputChat("Account " .. account .." exists in the database!", 0, 255, 0)
            else -- if the account doesn't exist
                player:outputChat("Account " .. account .." does not exist in database", 0, 255, 0)
            end
        else
            player:outputChat("Syntax is /checkaccount [account name]", 255, 0, 0)
        end
    end
end)