addCommandHandler ( "removeresource",
function ( playerSource, commandName, name )
    --Check if it is an admin using this command
    if not isObjectInACLGroup ( "user." .. getAccountName ( getPlayerAccount ( playerSource ) ), aclGetGroup ( "Admin" ) ) then
        outputChatBox ( "You are not allowed to use this command", playerSource )
        return
    end 
    --Did the user pass a valid resource name?
    if not name or name == "" or name == " " then
        outputChatBox ( "An invalid resource name has been passed (/removeresource <name>)", playerSource )
        return
    end
    --Let us check if the resource name exists
    --Get all resources
    local resourceTable = getResources ( ) 
    for resourceKey, resourceValue in ipairs ( resourceTable ) do
        local resourceName = getResourceName ( resourceValue )
        --Does the resource exist?
        if name == resourceName then
            --Stop the resource (maybe it is running)
            stopResource ( resourceValue )
            --Delete it
            local deleted = deleteResource ( name )
            if deleted then
                outputChatBox ( "Resource " .. name .. " has been successfully removed", playerSource )
            else
                outputChatBox ( "There is an unknown problem with the resource", playerSource )			
            end
            --The function is finished and was successful, return to stop it
            return
        end
    end
    --If a resource with the specified name does not exist show an error message
    outputChatBox ( "The specified resource does not exist", playerSource )
end )