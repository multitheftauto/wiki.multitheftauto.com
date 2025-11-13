local playerList = guiCreateGridList(0.80, 0.40, 0.15, 0.35, true)
guiGridListAddColumn(playerList, "Player", 0.85)

for _, player in ipairs(getElementsByType("player")) do
	guiGridListAddRow(playerList, getPlayerName(player))
end