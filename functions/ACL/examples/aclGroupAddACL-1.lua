local function addAclGroup(thePlayer, commandName, groupName, aclName)
    if (not groupName or not aclName) then -- Was the group name and ACL provided?
        outputChatBox("You must provide both the group name and the ACL!", thePlayer, 255, 255, 255)
        return
    end

    local acl = aclGet(aclName)
    if (acl) then -- Does an ACL with that name exist?
        local group = aclGetGroup(groupName)
        if (group) then -- Does a group with that name exist?
            aclGroupAddACL(group, acl)
            aclSave()
        else
            outputChatBox("Group with the name "..groupName.." does not exist", thePlayer, 255, 255, 255)
        end
    else
        outputChatBox("ACL "..aclName.." does not exist", thePlayer, 255, 255, 255)
    end
end
addCommandHandler("addAclGroup", addAclGroup)