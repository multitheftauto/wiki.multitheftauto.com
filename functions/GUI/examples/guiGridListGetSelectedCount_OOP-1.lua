local gridlist = GuiGridList(100, 100, 200, 100, false)
gridlist:addColumn("Players", 0.50)

for i, v in ipairs(Element.getAllByType("player")) do
    gridlist:setItemText(gridlist:addRow(), 1, v.name, false, false)
end

for b = 0, gridlist.rowCount do
    if (string.find(gridlist:getItemText(b, 1), "a", 1, true)) then
        gridlist:setSelectedItem(b, 1)
    end
end

outputChatBox("The number of Players with 'a' in their name: " .. gridlist.selectedCount .. ".")
