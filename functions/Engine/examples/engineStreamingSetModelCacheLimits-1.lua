addEventHandler("onClientResourceStart", resourceRoot,
    function()
        engineStreamingSetModelCacheLimits(0, 0)
    end
)