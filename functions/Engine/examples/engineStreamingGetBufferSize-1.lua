addCommandHandler("sbs", function(_, sizeMB)
    if tonumber(sizeMB) then
        if engineStreamingSetBufferSize(tonumber(sizeMB) * 1024 * 1024) then -- Convert MB to Bytes
            outputChatbox("The streaming buffer size has been changed from " .. math.floor(engineStreamingGetBufferSize() / 1024 / 1024) .. " MB to " .. sizeMB .. " MB")
        else
            outputChatbox("Not enough memory!")
        end
    else
        outputChatbox("Please enter a numeric value!")
    end
end, false, false)