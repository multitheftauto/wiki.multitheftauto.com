local function addAclGroup(thePlayer, commandName, groupName, aclName)
    if (not groupName or not aclName) then -- Was the group name and ACL provided?
        thePlayer:outputChat("You must provide both the group name and the ACL!", 255, 255, 255)
        return
    end

    local acl = ACL.get(aclName)
    if (acl) then -- Does an ACL with that name exist?
        local group = ACLGroup.get(groupName)
        if (group) then -- Does a group with that name exist?
            group:addACL(acl)
            ACL.save()
        else
            thePlayer:outputChat("Group with the name " .. groupName .." does not exist", 255, 255, 255)
        end
    else
        thePlayer:outputChat("ACL " .. aclName .. " does not exist", 255, 255, 255)
    end
end
addCommandHandler("addAclGroup", addAclGroup)
