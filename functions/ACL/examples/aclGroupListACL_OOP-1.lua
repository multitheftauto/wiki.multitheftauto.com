addCommandHandler("aclList", function(player, command, aclGroup)
    if (not aclGroup) then -- Was the group name provided?
        player:outputChat("You must provide the group name", 255, 255, 255)
        return
    end

    local group = ACLGroup.get(aclGroup)
    if (group) then -- Does a group with that name exist?
        local acls = group.aclList
        player:outputChat("List of ACL entries for group " .. aclGroup .. " (#" .. #acls ..")", 255, 255, 255)

        for k, v in ipairs(acls) do
			player:outputChat("- " .. v.name)
		end
    else
        player:outputChat("Group with the name " .. aclGroup .." does not exist.", 255, 255, 255)
    end
end)
