addCommandHandler("aclObjectList",function(player,command,aclGroup)
	if aclGroup == '' then
		outputChatBox("Please add the aclGroup you want the list of.", player)
		outputChatBox("Syntax: /aclObjectList aclGroup", player)
		return
	end
	local objects = aclGroupListObjects(aclGetGroup(aclGroup))
	for k,v in ipairs(objects) do
		outputChatBox("ACL LIST: "..aclGroup.." #"..k.." Object: "..v,player)
	end
end)