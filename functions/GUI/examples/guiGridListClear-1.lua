-- create the grid list
local playerList = guiCreateGridList(0.80, 0.40, 0.15, 0.35, true)
guiGridListAddColumn(playerList, "#", 0.15)
guiGridListAddColumn(playerList, "Player", 0.75)

-- fill the grid list with player names
for index, player in ipairs(getElementsByType("player")) do
    guiGridListAddRow(playerList, index, getPlayerName(player))
end

-- create a button to clear the grid list
local clearButton = guiCreateButton(0.80, 0.30, 0.15, 0.05, "Clear list", true)

-- when the button is clicked, clear the grid list
addEventHandler("onClientGUIClick", clearButton, function()
    guiGridListClear(playerList)
end)