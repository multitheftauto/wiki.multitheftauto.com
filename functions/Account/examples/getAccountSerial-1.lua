addCommandHandler("getaccserial", function(player, cmd, accountName)
    if (accountName) then
        local account = getAccount(accountName) -- get account from name
        if (account) then
            outputChatBox("Serial: " .. getAccountSerial(account), player) -- get serial
        else
            outputChatBox("Account not found", player)
        end
    end
end)