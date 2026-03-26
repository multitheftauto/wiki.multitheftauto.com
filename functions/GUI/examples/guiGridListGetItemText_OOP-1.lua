-- Create the grid list
local playerList = GuiGridList(0.80, 0.10, 0.15, 0.60, true)
-- Create a players column in the list
local column = playerList:addColumn("Player", 0.85)
if (column) then -- If the column has been created, fill it with players
    for id, playeritem in ipairs(Element.getAllByType("player")) do
        local row = playerList:addRow()
        playerList:setItemText(row, column, playeritem.name, false, false)
    end
end

function click()
    local playerName = playerList:getItemText(playerList:getSelectedItem(), 1)
    outputChatBox(playerName)
end
addEventHandler("onClientGUIClick", playerList, click)
