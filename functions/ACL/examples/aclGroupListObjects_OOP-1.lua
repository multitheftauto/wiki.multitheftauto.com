addCommandHandler("aclObjectList", function(player, command, aclGroup)
	if (not aclGroup) then -- Was the group name provided?
		player:outputChat("You must provide the group name!", 255, 255, 255)
		return
	end

	local group = ACLGroup.get(aclGroup)
	if (group) then
		local objects = group.objects -- or group:listObjects()
		player:outputChat("List of objects in group "..aclGroup.." (#"..#objects..")", 255, 255, 255)

		for k, v in ipairs(objects) do
			player:outputChat("- "..v)
		end
	else
		player:outputChat("Group with the name "..aclGroup.." does not exist.", 255, 255, 255)
	end
end)