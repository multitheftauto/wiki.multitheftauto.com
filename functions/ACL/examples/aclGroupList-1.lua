local function showGroups(player)
    local groups = aclGroupList() or {}
    for i, v in ipairs(groups) do
        local name = aclGroupGetName(v)
        outputChatBox(name, player, 255, 255, 255)
    end
end
addCommandHandler("showAclGroups", showGroups)
