local function removeACLGroup ( source, command, groupName )
	-- Check if they're an admin...
	if (isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup( "Admin"))) then
		if (groupName) then -- Check if they specified the group name
			local group = aclGetGroup(groupName) -- Return any groups matching the name
			if (group) then -- If any were returned then...
				aclDestroyGroup(group) -- Destroy that group
			else
				-- Tell them if no groups with that name were found...
				outputChatBox("No group with that name was found.", source, 255, 0, 0)
			end
		else -- If they didn't specify the group
			outputChatBox("Please specify the group name.", source, 255, 0, 0) -- Tell them that they must
		end
	else -- If they're not an admin....
		outputChatBox("You must be an admin to use this command", source, 255, 0, 0) -- Tell them it's restricted
	end
end
addCommandHandler("removeACL", removeACLGroup) -- Make it happen when somebody types "/removeACL"