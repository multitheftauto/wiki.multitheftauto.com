local function outputAdminGroupAccounts(player)
	local group = aclGetGroup("Admin")
	if (group) then -- Does the group exist?
		local admins = {}
		local objects = aclGroupListObjects(group) or {}
		for k,v in ipairs(objects) do
			local objectType = gettok(v, 1, string.byte("."))
			-- objectType: gets the object type only, which can be either "user" or "resource"
			if (objectType == "user") then -- checks if it's a player account
				local name = gettok(object, 2, string.byte(".")) -- ignores "user." by separating that from the account name
				table.insert(admins, name) -- adds the account name to the "admins" table
			end
		end

		outputChatBox(table.concat(admins, ", "), player, 255, 255, 255) -- output: John, Bob, Ghost
	else
		outputChatBox("The group named Admin does not exist.", player, 255, 255, 255)
	end
end
addCommandHandler("getAdminAccounts", outputAdminGroupAccounts)
-- adds the command "getAdminAccounts" and attaches it to the function "outputAdminGroupAccounts"