-- create the grid list
local playerList = GuiGridList(0.80, 0.40, 0.15, 0.35, true)
playerList:addColumn("#", 0.15)
playerList:addColumn("Player", 0.75)

-- fill the grid list with player names
for index, player in ipairs(Element.getAllByType("player")) do
    playerList:addRow(index, player.name)
end

-- create a button to clear the grid list
local clearButton = GuiButton(0.80, 0.30, 0.15, 0.05, "Clear list", true)

-- when the button is clicked, clear the grid list
addEventHandler("onClientGUIClick", clearButton, function()
    playerList:clear()
end)