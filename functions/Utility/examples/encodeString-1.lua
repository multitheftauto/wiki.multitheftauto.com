addCommandHandler("encode", function(player, _, algorithm, key, ...)
    if not algorithm or not key then
        outputChatBox("Invalid algorithm and/or key.", player, 255, 0, 0)
        return
    end
    local text = table.concat({...}, " ")
    if type(text) ~= "string" or text == "" then
        outputChatBox("Please specify text in the command.", player, 255, 0, 0)
        return
    end
    local encoded = encodeString(algorithm, text, { key = key })
    if not encoded then
        outputChatBox("Failed to encode. Make sure that all arguments are valid.", player, 255, 0, 0)
        return
    end

    outputChatBox("The result of " .. algorithm .. " encoding is: " .. encoded, player)
end)