addCommandHandler("changeaccountname", function(player, _, oldname, newname)
    if (not oldname or not newname) then
        return
    end

    local account = getAccount(oldname)
    if (not account) then
        return 
    end

    setAccountName(account, newname)
    outputChatBox("Success!", player)
end)