local list = GuiGridList(0.80, 0.10, 0.15, 0.60, true)
list:addColumn("Some title")

list:addRow("Green item")
list:addRow("Normal item")

list:setItemColor(0, 1, 0, 255, 0)