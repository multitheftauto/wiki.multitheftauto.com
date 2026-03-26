local comboBox = GuiComboBox(400, 350, 250, 300, "Some list", false)
comboBox:addItem("First item")
comboBox:addItem("Second item")
comboBox:addItem("Third item")

comboBox.selected = 1 -- Select the second item (index starts at 0)
local text = comboBox:getItemText(comboBox.selected) -- Get the text of the selected item
print(text) -- Output: "Second item"