-- This example creates a grid list of all players, clicking "Selected" button will then use guiGridListGetSelectedItems to show all selected items.
local playerWindow = GuiWindow(526, 230, 291, 284, "", false)
local gridlistPlayers = GuiGridList(9, 23, 272, 201, false, playerWindow)
gridlistPlayers:addColumn("Players", 0.9)
gridlistPlayers.selectionMode = 1 -- So can select many players

for _, players in ipairs(Element.getAllByType("player")) do 
	local row = gridlistPlayers:addRow()
	gridlistPlayers:setItemText(row, 1, players.name, false, false)
end 

local buttonSelectedPlayer = GuiButton(9, 227, 272, 20, "Selected", false, playerWindow)

function seeSelected()
	local selected = gridlistPlayers.selectedItems
	for i, data in ipairs(selected) do -- Loops through all selected items
		outputChatBox(gridlistPlayers:getItemText(data["row"], 1)) -- Shows player name of selected players
	end
end
addEventHandler("onClientGUIClick", buttonSelectedPlayer, seeSelected, false)