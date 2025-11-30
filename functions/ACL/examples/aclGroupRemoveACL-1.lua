addEventHandler("onResourceStart", resourceRoot, function()
    if (aclGroupRemoveACL(aclGetGroup("Moderator"), aclGet("Admin"))) then
        aclSave()
        outputConsole("The Admin acl was removed from the Moderator group.") -- If it was successfully removed
    else
        outputConsole("Unsuccessful... Admin might have been removed from the Moderator group before.") -- if it was removed before or didn't existed
    end
end)
