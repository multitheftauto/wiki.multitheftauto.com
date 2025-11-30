local function addACLGroupObject(thePlayer, commandName, groupName, objectName)
    local ourGroup = ACLGroup.get(groupName)
    -- if there is no previous group with this name, we need to create one
    if (not ourGroup) then
        ourGroup = ACLGroup(groupName)
    end

    -- if object name wasn't given
    if (not objectName) then
        -- print out message to chatbox
        return thePlayer:outputChat("You need to specify the object!")
    end

    -- and finally let's add the object to it's group
    ourGroup:addObject(objectName)
    -- don't forget to save the ACL after it has been modified
    ACL.save()
end
addCommandHandler("addobjecttogroup", addACLGroupObject)
