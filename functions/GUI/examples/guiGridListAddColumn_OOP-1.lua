local playerList = GuiGridList(0.80, 0.40, 0.15, 0.35, true)
playerList:addColumn("Player", 0.85)

for _, player in ipairs(Element.getAllByType("player")) do
	playerList:addRow(player.name)
end