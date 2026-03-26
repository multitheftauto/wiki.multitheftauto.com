-- Create a gridlist
local list = GuiGridList(0.30, 0.10, 0.5, 0.60, true)

-- Create 4 columns
for i = 1,4 do
    list:addColumn("Column "..tostring(i), 0.25)
end

setTimer(function()
    local column = math.random(1,4)
    list:removeColumn(column)
    outputChatBox("Column "..tostring(column).." has been removed")
end, 3000, 1)