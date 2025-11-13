local function reloadACL(source, command)
	-- Check if they're an admin...
	if (isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup( "Admin"))) then
		local reload = aclReload() -- Reload the ACL
		if (reload) then -- Check it was reloaded successfully
			outputChatBox("ACL was successfully reloaded.", source, 255, 0, 0) -- If so, output it
		else -- If not, output it (line below)
			outputChatBox("An unknown error occured. Please check the ACL file exists.", source, 255, 0, 0)
		end
	else -- If they're not an admin, output it (below)
		outputChatBox("You must be an admin to use this command!", source, 255, 0, 0)
	end
end
addCommandHandler("reloadACL", reloadACL)