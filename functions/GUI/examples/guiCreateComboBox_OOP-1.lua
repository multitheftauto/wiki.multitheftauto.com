local playersList = GuiComboBox(300, 300, 200, 400, "Players", false)

for k, v in ipairs(Element.getAllByType("player")) do
    playersList:addItem(v.name)
end