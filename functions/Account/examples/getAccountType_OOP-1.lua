addCommandHandler("accountInfo", function(player, cmd, accountName)
    if (not accountName) then
        player:outputChat("You have to provide an account's name to get info from!")
        return
    end

    local acc = Account(accountName)
    if (not acc) then
        player:outputChat("That account doesn't exist!")
        return
    end
    
    local accName = acc.name
    local accType = acc:getType()
    player:outputChat('Account name: '..accName..', type: '..accType)
end)