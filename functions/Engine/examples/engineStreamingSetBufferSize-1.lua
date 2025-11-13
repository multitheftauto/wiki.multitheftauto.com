addCommandHandler("sbs", function(_, sizeMiB)
    local previousSizeMiB = math.floor(engineStreamingGetBufferSize() / 1024 / 1024) -- Convert Bytes to MiB
    if tonumber(sizeMiB) then
        if engineStreamingSetBufferSize(tonumber(sizeMiB) * 1024 * 1024) then -- Convert MiB to Bytes
            outputChatBox("The streaming buffer size has been changed from " .. previousSizeMiB .. " MiB to " .. sizeMiB .. " MiB")
        else
            outputChatBox("Not enough memory!")
        end
    else
        outputChatBox("Please enter a numeric value!")
    end
end, false, false)