addCommandHandler("getAccounts", function (player, cmd)
	local serial = player.serial
	local accounts = Account.getAllBySerial(serial)
	player:outputChat("You have " .. #accounts .. " accounts.")
end)