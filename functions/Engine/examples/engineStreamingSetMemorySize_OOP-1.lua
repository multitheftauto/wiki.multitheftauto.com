addCommandHandler("ssms", function(_, sizeMB)
    if tonumber(sizeMB) then
        outputChatBox("The maximum streaming memory available has been changed from " .. math.floor(EngineStreaming.memorySize / 1024 / 1024) .. " MB to " .. sizeMB .. " MB")      
        EngineStreaming.memorySize = tonumber(sizeMB) * 1024 * 1024 -- Convert MB to Bytes
    else
        outputChatBox("Please enter a numeric value!")
    end
end, false, false)