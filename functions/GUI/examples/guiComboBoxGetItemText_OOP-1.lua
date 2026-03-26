local comboBox = GuiComboBox(100, 100, 300, 400, "Select something", false)
comboBox:addItem("value1")
comboBox:addItem("value2")

local text = comboBox:getItemText(1)
print(text) -- This will print "value2"