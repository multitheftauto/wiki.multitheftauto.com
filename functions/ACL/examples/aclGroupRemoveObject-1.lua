function deladm (playerSource, commandName, accountName)
	if accountName then --Make the script able to detect if a user is given.
		aclGroupRemoveObject (aclGetGroup("Admin"), "user."..accountName) --Removing the admin.
		outputChatBox ("ACL: Account '"..accountName.."' succesfully removed as admin.", playerSource) -- Giving you a messsage.
		outputChatBox ("ACL: Someone have removed you as admin.", accountName) -- giving the poor removed guy a message.
	else --Make the Syntax display.
		outputChatBox ("ACL: No account name specified.", playerSource)
		outputChatBox ("ACL: Syntax: /deladmin [accountName]", playerSource)
	end
end
addCommandHandler ("deladmin", deladm)