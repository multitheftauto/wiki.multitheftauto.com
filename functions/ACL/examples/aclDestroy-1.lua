local function deleteSomeACL(thePlayer, cmdname, theACL)
    local acl = aclGet(theACL)
    if (acl) then -- Check if the specified ACL exists
        -- If it does
        aclDestroy(acl) -- Remove the ACL
        outputChatBox("ACL " .. theACL .. " Succesfully removed!", thePlayer)
    else -- If the ACL doesn't exists
        outputChatBox("Error: Invalid ACL Name specified, or the ACL doesn't exist.", thePlayer)
    end
end
addCommandHandler("deleteACL", deleteSomeACL) -- Add the commandhandler
