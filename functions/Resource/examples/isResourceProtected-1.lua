function resourceProtectedCommand(thePlayer, command, resourceName)
    if resourceName then -- If the player provided a resource name.
        local theResource = getResourceFromName(resourceName) -- Get the resource element.
        if theResource then -- If we have an element, the resource must exist.
            local protectedResource = isResourceProtected(theResource) -- Check to see if the resource is protected.
            if protectedResource then -- if it is protected.
                outputChatBox("This resource is a protected resource in the server config.", thePlayer, 0, 255, 0)
            else -- If the resource is not protected.
                outputChatBox("This resource is not a protected resource in the server config.", thePlayer, 0, 255, 0)
            end
        else -- A resource with the name didn't exist.
            outputChatBox("A resource with the name '" .. resourceName .. "' does not exist!", thePlayer, 255, 0, 0)
        end
    else -- The player didn't provide a resource name.
        outputChatBox("Please specify a resource name.", thePlayer, 255, 0, 0)
    end
end
addCommandHandler("isprotected", resourceProtectedCommand)