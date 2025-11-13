function addACLGroupObject ( thePlayer, commandName, groupName, objectName )
    local ourGroup = aclGetGroup ( groupName )
    -- if there is no previous group with this name, we need to create one
    if not ourGroup then
        ourGroup = aclCreateGroup ( groupName )
    end

    -- if object name wasn't given
    if not objectName then
        -- print out message to chatbox
        return outputChatBox ( "You need to specify the object!", thePlayer )
    end

    -- and finally let's add the object to it's group
    aclGroupAddObject ( ourGroup, objectName )
    -- don't forget to save the ACL after it has been modified
    aclSave ()
end
addCommandHandler ( "addobjecttogroup", addACLGroupObject )