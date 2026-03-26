local comboBox = guiCreateComboBox(300, 300, 200, 100, "Select an item", false)
guiComboBoxAddItem(comboBox, "Item 1")
guiComboBoxAddItem(comboBox, "Item 2")

addCommandHandler("getSelected", function(command)
    local item = guiComboBoxGetSelected(comboBox)
    if (item == -1) then
        outputChatBox("No item selected!")
        return
    end

    local text = guiComboBoxGetItemText(comboBox, item)

    outputChatBox("Currently selected item with ID: " .. tostring(item) .. " and with text: " .. text)
end)
