addEventHandler("onClientResourceStart", resourceRoot, function()
    engineStreamingSetModelCacheLimits(128, 128)
end)
