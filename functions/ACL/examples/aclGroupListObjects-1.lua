addCommandHandler("aclObjectList",function(player,command,aclGroup)
	if (not aclGroup) then -- Was the group name provided?
		outputChatBox("You must provide the group name!", player, 255, 255, 255)
		return
	end

	local group = aclGetGroup(aclGroup)
	if (group) then
		local objects = aclGroupListObjects(group)
		outputChatBox("List of objects in group "..aclGroup.." (#"..#objects..")", player, 255, 255, 255)

		for k,v in ipairs(objects) do
			outputChatBox("- "..v, player)
		end
	else
		outputChatBox("Group with the name "..aclGroup.." does not exist.", player, 255, 255, 255)
	end
end)