addCommandHandler("addItem", function(command, value)
    comboBox:addItem(value)
    outputChatBox("Item with text " .. value .. " has been added!")
end)
