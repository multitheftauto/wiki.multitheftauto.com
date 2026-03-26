local playerList = GuiGridList(0.80, 0.10, 0.15, 0.60, true)
-- Create a players column in the list
local column = playerList:addColumn("Player", 0.85)
if (column) then -- If the column has been created, fill it with players
    for id, player in ipairs(Element.getAllByType("player")) do
        local row = playerList:addRow()
        local r, g, b = player:getNametagColor() -- We get the player nametag color.
        playerList:setItemText(row, column, player.name, false, false)
        playerList:setItemColor(row, column, r, g, b) -- We set the grid list item color to the returned values of getPlayerNametagColor.
    end
end

function onGridListClick()
    local row, col = source:getSelectedItem()
    if (row and col and row ~= -1 and col ~= -1) then
        local r, g, b, a = source:getItemColor(row, col)
        outputChatBox("Red: " .. r, 255, 0, 0)
        outputChatBox("Green: " .. g, 0, 255, 0)
        outputChatBox("Blue: " .. b, 0, 0, 255)
        outputChatBox("Alpha: " .. a, 255, 255, 255)
    end
end
addEventHandler("onClientGUIClick", playerList, onGridListClick, false)