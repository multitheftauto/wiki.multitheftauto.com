local function deladm(playerSource, commandName, accountName)
	if (accountName) then -- Was the account name provided?
		local group = aclGetGroup("Admin")
		if (group) then
			if (isObjectInACLGroup("user."..accountName, group)) then -- Is the account in the Admin group?
				aclGroupRemoveObject(group, "user."..accountName)
				outputChatBox("Account "..accountName.." succesfully removed as admin.", playerSource, 255, 255, 255)
			else
				outputChatBox("Account "..accountName.." is not in the Admin group.", playerSource, 255, 255, 255)
			end
		end
	else
		outputChatBox("No account name specified.", playerSource, 255, 255, 255)
	end
end
addCommandHandler("deladmin", deladm)