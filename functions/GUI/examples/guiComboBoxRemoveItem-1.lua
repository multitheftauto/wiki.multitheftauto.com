local comboBox = guiCreateComboBox(10, 10, 200, 100, "Select an item", false)
guiComboBoxAddItem(comboBox, "Item 1")
guiComboBoxAddItem(comboBox, "Item 2")

addCommandHandler("remove", function()
    local item = guiComboBoxGetSelected(comboBox)
    if (item == -1) then
        outputChatBox("No item selected!")
        return
    end

    local text = guiComboBoxGetItemText(comboBox, item)
    guiComboBoxRemoveItem(comboBox, item)
    outputChatBox("Item with text " .. text .. " has been removed!")
end)
