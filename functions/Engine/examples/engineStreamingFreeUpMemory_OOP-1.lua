addEventHandler("onClientResourceStart", resourceRoot, function()
    EngineStreaming.freeUpMemory(104857600) -- 100 megabytes
end)
