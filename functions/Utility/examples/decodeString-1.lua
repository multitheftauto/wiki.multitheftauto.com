addCommandHandler("decode", 
    function(player, _, algorithm, key, ...)
        if algorithm and key then
            local text = table.concat({...}, " ")
            if type(text) == "string" and text ~= "" then
                local decoded = decodeString(algorithm, text, { key = key })
                if decoded then
                    outputChatBox("The result of " .. algorithm .. " decoding is: " .. decoded, player)
                else
                    outputChatBox("Failed to decode. Make sure that all arguments are valid.", player, 255, 0, 0)
                end
            else
                outputChatBox("Please specify text in the command.", player, 255, 0, 0)
            end
        else
            outputChatBox("Invalid algorithm and/or key.", player, 255, 0, 0)
        end
    end
)