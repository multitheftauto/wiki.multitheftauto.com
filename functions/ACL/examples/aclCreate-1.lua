function setACLRight ( thePlayer, commandName, aclName, rightName, access )
    -- turn the boolean string to lower case
    access = string.lower ( access )
    -- access has to be either true or false (booleans)
    if not (access == "true" or access == "false") then
        -- print out error message to debug window
        return outputDebugString ( "Invalid access; true and false are only accepted", 1 )
    end

    -- change the access to boolean
    if access == "true" then
        access = true
    else 
        access = false
    end

    local ourACL = aclGet ( aclName )
    -- if there is no previous ACL with this name, we need to create one
    if not ourACL then
        ourACL = aclCreate ( aclName )
    end

    -- and finally let's set the right
    aclSetRight ( ourACL, rightName, access )
    -- don't forget to save the ACL after it has been modified
    aclSave ()
end
addCommandHandler ( "setaclright", setACLRight )