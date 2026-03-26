local list = GuiGridList(0.80, 0.40, 0.15, 0.35, true)
list:addColumn("#", 0.15)
list:addColumn("name", 0.75)

for index, player in ipairs(Element.getAllByType("player")) do
	list:addRow(index, player.name)
end