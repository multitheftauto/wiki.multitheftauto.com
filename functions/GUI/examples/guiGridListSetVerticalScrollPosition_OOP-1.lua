local list = GuiGridList(0.80, 0.10, 0.15, 0.60, true) -- Create the grid list
local column = list:addColumn("New column", 1) -- Create a new column in the grid list

for i = 1, 100 do
    list:addRow("Item " .. tostring(i))
end

list.verticalScrollPosition = 50 -- in the middle
outputChatBox("Current position of the vertical scroll: " .. tostring(list.verticalScrollPosition) .. "%") -- output to the chatbox