addCommandHandler("getAccounts", function(player, cmd)
	local ip = player.ip
	local accounts = Account.getAllByIP(ip)
	player:outputChat("You have "..#accounts.." accounts.")
end)