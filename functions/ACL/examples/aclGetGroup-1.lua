function giveAdminRights (playerSource, commandName, accountName) --add the function giveAdminRights and specify its arguments
	if accountName then --if there was an accountName entered then
		aclGroupAddObject (aclGetGroup("Admin"), "user."..accountName)) --add an ACL object using the form "user.[accountName]" to the ACL group "Admin"
		outputChatBox ("Account '"..accountName.."' succesfully added to the admin group", playerSource) --output a notification to the player who entered the command that the acocunt was successfully added
	else --else output an error message and the correct syntax of the command to the player who entered it
		outputChatBox ("No account name specified.", playerSource)
		outputChatBox ("Correct syntax: /giveAccountAdminRights [accountName]", playerSource)
	end
end

addCommandHandler ("giveAccountAdminRights", giveAdminRights) --add a command "giveAccountAdminRights" and attch the function "giveAdminRights" to it