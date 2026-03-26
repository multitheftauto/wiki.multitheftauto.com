local gridList = GuiGridList(0.80, 0.10, 0.15, 0.60, true) -- Create the grid list
local column = gridList:addColumn("New column", 1) -- Create a new column in the grid list

for i = 1,30 do
    gridList:addRow("Item "..tostring(i))
end

gridList.verticalScrollPosition = 25

local postion = gridList.verticalScrollPosition -- get the vertical scroll position
outputChatBox("Current position of the vertical scroll: " ..tostring(position) .. "%") -- output to the chatbox