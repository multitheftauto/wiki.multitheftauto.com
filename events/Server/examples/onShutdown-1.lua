addEventHandler('onShutdown', root, function(resource, reason)
    outputServerLog("Server shutdown by resource: "..(resource and getResourceName(resource) or "Unknown").." Reason: "..reason)
end)