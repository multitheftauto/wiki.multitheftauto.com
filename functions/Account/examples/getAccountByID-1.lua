addCommandHandler("getAccount", function (player, cmd, id)
    local id = tonumber(id)
	local account = getAccountByID(id)
    if (account) then
		outputChatBox("The name of the account with that ID is: "..getAccountName(account), player)
    else 
        outputChatBox("There is no account with this ID.", player)
    end
end)