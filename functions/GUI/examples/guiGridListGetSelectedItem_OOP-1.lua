local list = GuiGridList(0.8, 0.1, 0.15, 0.6, true)

-- Create a players column in the list
local column = list:addColumn('Numbers', 0.85)

for i = 1,15 do
    local r = list:addRow()
    list:setItemText(r, 1, "Item "..i, false, false)
end

addEventHandler('onClientGUIClick', list, function()
    local row, column = list:getSelectedItem()
    local text = list:getSelectedItemText(list, row, column)

    outputChatBox("You selected... ".text)
end)
