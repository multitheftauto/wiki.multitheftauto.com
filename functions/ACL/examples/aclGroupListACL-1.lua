addCommandHandler("aclList", function(player, command, aclGroup)
    if (not aclGroup) then -- Was the group name provided?
        outputChatBox("You must provide the group name", player, 255, 255, 255)
        return
    end

    local group = aclGetGroup(aclGroup)
    if (group) then -- Does a group with that name exist?
        local acls = aclGroupListACL(group)
        outputChatBox("List of ACL entries for group " .. aclGroup, player, 255, 255, 255)

        for k, v in ipairs(acls) do
            outputChatBox("- " .. aclGetName(v), player)
        end
    else
        outputChatBox("Group with the name " .. aclGroup .. " does not exist.", player, 255, 255, 255)
    end
end)
