local comboBox = guiCreateComboBox(100, 150, 200, 300, "", false)
guiComboBoxAddItem(comboBox, "First item")
guiComboBoxAddItem(comboBox, "Second item")

addCommandHandler("setText", function(cmd, text)
    local item = guiComboBoxGetSelected(comboBox)
    if (item == -1) then
        outputChatBox("No item selected.")
        return
    end

    guiComboBoxSetItemText(comboBox, item, text)
end)
