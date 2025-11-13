local function showGroups(player)
	local groups = ACLGroup.list() or {}
	for i,v in ipairs(groups) do
		local name = v.name
		player:outputChat(name, 255, 255, 255)
	end
end
addCommandHandler("showAclGroups",showGroups)