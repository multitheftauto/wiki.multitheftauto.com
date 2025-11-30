addCommandHandler("changeaccountname", function(player, _, oldname, newname)
    if (not oldname or not newname) then return end

    local account = Account(oldname)
    if (not account) then return end

    account.name = newname
    player:outputChat("Success!")
end)