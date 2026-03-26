local gridList = GuiGridList(0.80, 0.10, 0.15, 0.60, true) -- Create the grid list

for i = 1,4 do
    gridList:addColumn("Column "..tostring(i), 0.8) -- Create a new column in the grid list
end

for i = 1,30 do
    local text = "Item "..tostring(i)
    gridList:addRow("#1 "..text, "#2 "..text, "#3 "..text, "#4 "..text)
end

addCommandHandler('scrollpos', function()
    local pos = gridList.horizontalScrollPosition
    print('Horizontal scroll: '..tostring(pos))
end)