addEventHandler("onResourceStart", resourceRoot,
    function ()
        outputChatBox(getResourceName(resource) .. "'s path: " .. getResourceOrganizationalPath(resource))
    end)