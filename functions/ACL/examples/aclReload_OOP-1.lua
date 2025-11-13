local function reloadACL(source, command)
	-- Check if they're an admin...
	if (ACLGroup.get("Admin"):doesContainObject("user."..source.account.name)) then
		local reload = ACL.reload() -- Reload the ACL
		if (reload) then -- Check it was reloaded successfully
			source:outputChat("ACL was successfully reloaded.", 255, 0, 0) -- If so, output it
		else -- If not, output it (line below)
			source:outputChat("An unknown error occured. Please check the ACL file exists.", 255, 0, 0)
		end
	else -- If they're not an admin, output it (below)
		source:outputChat("You must be an admin to use this command!", 255, 0, 0)
	end
end
addCommandHandler("reloadACL", reloadACL)