local function setACLRight(thePlayer, commandName, aclName, rightName, access)
    -- turn the boolean string to lower case
    access = string.lower ( access )
    -- access has to be either true or false (booleans)
    if (access ~= "true" and access ~= "false") then
        -- print out error message to debug window
        return outputDebugString("Invalid access; true and false are only accepted", 1)
    end

    -- change the access to boolean
    access = access == "true"

    local ourACL = ACL.get(aclName)
    -- if there is no previous ACL with this name, we need to create one
    if (not ourACL) then
        ourACL = ACL(aclName)
    end

    -- and finally let's set the right
    ourACL:setRight(rightName, access)
    -- don't forget to save the ACL after it has been modified
    ACL.save()
end
addCommandHandler("setaclright", setACLRight)