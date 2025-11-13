function deleteSomeACL ( thePlayer, cmdname, theACL )
    if aclGet ( theACL ) then --Check if the specified ACL exists
        --If it does
        local deleted = aclDestroy ( theACL ) --Try to delete the ACL
        if deleted then --If the ACL has been deleted
            --We will give the player a succes-message
            outputChatBox ( "ACL " ..theACL.. " Succesfully removed!", thePlayer )
        else --If there was something wrong while deleting
            --We send the player an error message
            outputChatBox ( "Error while removing ACL " ..theACL.. "!", thePlayer )
        end
    else --If the ACL doesn't exists
        outputChatBox ( "Error: Invalid ACL Name specified, or the ACL doesn't exist.", thePlayer )
    end
end
addCommandHandler ( "deleteACL", deleteSomeACL ) --Add the commandhandler