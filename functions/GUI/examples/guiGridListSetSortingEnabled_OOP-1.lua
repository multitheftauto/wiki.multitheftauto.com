local list = GuiGridList(0.50, 0.50, 0.20, 0.30, true)
list:addColumn("Players", 0.65)

for k, v in ipairs(Element.getAllByType("player")) do
    list:setItemText(list:addRow(), 1, v.name, false, false)
end

list.sortingEnabled = false