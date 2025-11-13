local function deladm(playerSource, commandName, accountName)
	if (accountName) then -- Was the account name provided?
		local group = ACLGroup.get("Admin")
		if (group) then
			if (group:doesContainObject("user."..accountName)) then -- Is the account in the Admin group?
				group:removeObject("user."..accountName)
				playerSource:outputChat("Account "..accountName.." succesfully removed as admin.", 255, 255, 255)
			else
				playerSource:outputChat("Account "..accountName.." is not in the Admin group.", 255, 255, 255)
			end
		end
	else
		playerSource:outputChat("No account name specified.", 255, 255, 255)
	end
end
addCommandHandler("deladmin", deladm)