-- This example creates a grid list of all players, clicking "Selected" button will then use guiGridListGetSelectedItems to show all selected items.
local playerWindow = guiCreateWindow(526, 230, 291, 284, "", false)
local gridlistPlayers = guiCreateGridList(9, 23, 272, 201, false, playerWindow)
guiGridListAddColumn(gridlistPlayers, "Players", 0.9)
guiGridListSetSelectionMode(gridlistPlayers, 1) -- So can select many players

for _, players in ipairs(getElementsByType("player")) do 
	local row = guiGridListAddRow(gridlistPlayers)
	guiGridListSetItemText(gridlistPlayers, row, 1, getPlayerName(players), false, false)
end 

local buttonSelectedPlayer = guiCreateButton(9, 227, 272, 20, "Selected", false, playerWindow)

function seeSelected()
	local selected = guiGridListGetSelectedItems(gridlistPlayers)
	for i, data in ipairs(selected) do -- Loops through all selected items
		outputChatBox(guiGridListGetItemText(gridlistPlayers, data["row"], 1)) -- Shows player name of selected players
	end
end
addEventHandler("onClientGUIClick", buttonSelectedPlayer, seeSelected, false)