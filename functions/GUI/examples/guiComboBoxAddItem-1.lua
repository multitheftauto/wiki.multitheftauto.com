addCommandHandler("addItem", function (command, value)
    guiComboBoxAddItem(comboBox, value)
    outputChatBox("Item with text " .. value .. " has been added!")
end)