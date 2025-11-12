addCommandHandler("chatlimit", function()
    outputChatBox("Current chatbox character limit: " .. tostring( getChatboxCharacterLimit() ) )
end)