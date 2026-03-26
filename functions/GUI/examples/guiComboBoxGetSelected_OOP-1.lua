local comboBox = GuiComboBox(300, 300, 200, 100, "Select an item", false)
comboBox:addItem("Item 1")
comboBox:addItem("Item 2")

addCommandHandler("getSelected", function(command)
    local item = comboBox.selected
    if (item == -1) then
        outputChatBox("No item selected!")
        return
    end

    local text = comboBox:getItemText(item)

    outputChatBox("Currently selected item with ID: " .. tostring(item) .. " and with text: " .. text)
end)
