addCommandHandler("aclList",function(player,command,aclGroup)
	if(aclGroup~="")then
		tables = aclGroupListACL(aclGetGroup(aclGroup))
		count = 0
		for list,nam in pairs(tables) do
			outputChatBox("ACL LIST: "..aclGroup.."Line: "..tostring(count).." ACL: "..aclGetName(nam)..".",player)
			count = count + 1
		end
	else
		outputChatBox("Please add the aclGroup you want the list of.",player)
		outputChatBox("Syntax: /aclList aclGroup",player)
	end
end)