addCommandHandler("checkaccount", function(player, cmd, account)
    if hasObjectPermissionTo(player, "function.banPlayer" ) then -- if the player typing /checkaccount command has permission to banPlayer
        if (account and account ~= "") then -- if the account name was mentioned
            if (getAccount(account)) then -- if the account exists
                outputChatBox("Account "..account.." exists in the database!", player, 0, 255, 0)
            else -- if the account doesn't exist
                outputChatBox("Account "..account.." does not exist in database", player, 0, 255, 0)
            end
        else
            outputChatBox("Syntax is /checkaccount [account name]", player, 255, 0, 0)
        end
    end
end)