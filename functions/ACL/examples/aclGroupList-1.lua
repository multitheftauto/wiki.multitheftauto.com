function showGroups(player)
	local groups = {}
	groups = aclGroupList()
	for i,v in ipairs(groups) do
		local name = aclGroupGetName(v)
		outputChatBox(tostring(name),player)
	end
end
addCommandHandler("showAclGroups",showGroups)