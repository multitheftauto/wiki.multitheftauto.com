addCommandHandler("chatlimit", function()
    outputChatBox("Current chatbox character limit: " ..tostring(GuiElement.chatboxCharacterLimit)) -- or GuiElement:getChatboxCharacterLimit()
end)
