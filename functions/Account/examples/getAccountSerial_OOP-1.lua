addCommandHandler("getaccserial", function (player, cmd, accountName)
    if (accountName) then 
	    local account = Account(accountName) -- get account from name
	    if (account) then
	        player:outputChat("Serial: " .. account.serial) -- get serial
	    else
	        player:outputChat("Account not found")
	    end
    end
end)