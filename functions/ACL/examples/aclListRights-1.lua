addCommandHandler("aclRights",function(player,command,theAcl)
	if (not theAcl) then -- Was the ACL provided?
		outputChatBox("No ACL name was provided.", player, 255, 255, 255)
		return
	end

	local acl = aclGet(theAcl)
	if (acl) then -- Does an ACL with that name exist?
		local rights = aclListRights(acl)
		outputChatBox("List of rights of ACL "..theAcl.." (#"..#rights.."): ", player, 255, 255, 255)
		for k,v in ipairs(rights) do
			outputChatBox("- "..v, player)
		end
	else
		outputChatBox("ACL "..theAcl.." does not exist", player, 255, 255, 255)
	end
end)