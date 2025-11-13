addCommandHandler("accountInfo", function(player, cmd, accountName)
    if (not accountName) then
        outputChatBox("You have to provide an account's name to get info from!", player)
        return
    end

    local acc = getAccount(accountName)
    if (not acc) then
        outputChatBox("That account doesn't exist!", player)
        return
    end
    
    local accName = getAccountName(acc)
    local accType = getAccountType(acc)
    outputChatBox('Account name: '..accName..', type: '..accType, player)
end)