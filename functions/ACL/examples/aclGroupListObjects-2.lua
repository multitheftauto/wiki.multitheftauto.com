function outputAdminGroupAccounts(player)
	local admins = {} -- creates the table in which will be added the accounts of "Admin" group
	local group = aclGetGroup("Admin")
	-- should return the "aclgroup" if the "Admin" group be found in ACL
	if not group then return end
	for _, object in ipairs(aclGroupListObjects(group) or {}) do
		local objType = gettok( object, 1, string.byte('.') )
		-- objType: gets the object type only, which can be either "user" or "resource"
		if objType == "user" then -- checks if it's a player account
			local _name = gettok( object, 2, string.byte('.') ) -- ignores "user." by separating that from the account name
			table.insert( admins, _name ) -- adds the account name to the "admins" table
		end
	end
    for i, name in ipairs(admins) do -- loop through the table "admins"
        outputChatBox(tostring(i).." : "..tostring(name), player, 140, 220, 140)
        -- output will look like this: "1 : John"
    end
end
addCommandHandler("getAdminAccounts", outputAdminGroupAccounts)
-- adds the command "getAdminAccounts" and attaches it to the function "outputAdminGroupAccounts"