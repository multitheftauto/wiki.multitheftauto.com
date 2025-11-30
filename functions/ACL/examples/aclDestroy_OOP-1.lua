local function deleteSomeACL(thePlayer, cmdname, theACL)
    local acl = ACL.get(theACL)
    if (acl) then -- Check if the specified ACL exists
        -- If it does
        acl:destroy() -- Remove the ACL
        thePlayer:outputChat("ACL " .. theACL .. " Succesfully removed!")
    else -- If the ACL doesn't exists
        thePlayer:outputChat("Error: Invalid ACL Name specified, or the ACL doesn't exist.")
    end
end
addCommandHandler("deleteACL", deleteSomeACL) -- Add the commandhandler
