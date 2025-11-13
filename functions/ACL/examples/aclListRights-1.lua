addCommandHandler("aclRights",function(player,command,theAcl)
	if(theAcl~="")then
		rights = aclListRights(aclGet(theAcl))
		count = 0
		for acl,list in pairs(rights)do
			outputChatBox("ACL List: "..theAcl.." #"..tostring(count).." Right: "..list..".",player)
			count = count + 1
		end
	else
		outputChatBox("Please type in a acl that you want to retrieve the rights from.",player)
		outputChatBox("Please use this Syntax: /aclRights theACL ",player)
	end
end)