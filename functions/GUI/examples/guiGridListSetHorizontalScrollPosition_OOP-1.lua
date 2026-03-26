local list = GuiGridList(0.80, 0.10, 0.15, 0.60, true) -- Create the grid list

for i = 1,4 do
    list:addColumn("Column "..tostring(i), 0.8) -- Create a new column in the grid list
end

for i = 1,30 do
    local text = "Item "..tostring(i)
    list:addRow("#1 "..text, "#2 "..text, "#3 "..text, "#4 "..text)
end

list.horizontalScrollPosition = 50 -- in the middle
outputChatBox("Current position of the horizontal scroll: " .. list.horizontalScrollPosition .. "%") -- output to the chatbox