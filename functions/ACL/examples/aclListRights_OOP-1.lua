addCommandHandler("aclRights",function(player,command,theAcl)
	if (not theAcl) then -- Was the ACL provided?
		player:outputChat("No ACL name was provided.", 255, 255, 255)
		return
	end

	local acl = ACL.get(theAcl)
	if (acl) then -- Does an ACL with that name exist?
		local rights = acl:listRights(acl)
		player:outputChat("List of rights of ACL "..theAcl.." (#"..#rights.."): ", 255, 255, 255)
		for k,v in ipairs(rights) do
			player:outputChat("- "..v)
		end
	else
		player:outputChat("ACL "..theAcl.." does not exist", 255, 255, 255)
	end
end)