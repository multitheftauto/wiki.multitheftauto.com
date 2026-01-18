addEventHandler("onClientResourceStart", resourceRoot, function()
    engineStreamingFreeUpMemory(104857600) -- 100 megabytes
end)
