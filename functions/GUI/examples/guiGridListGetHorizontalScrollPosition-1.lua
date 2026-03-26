local gridList = guiCreateGridList(0.80, 0.10, 0.15, 0.60, true) -- Create the grid list

for i = 1,4 do
    guiGridListAddColumn(gridList, "Column "..tostring(i), 0.8) -- Create a new column in the grid list
end

for i = 1,30 do
    local text = "Item "..tostring(i)
    guiGridListAddRow(gridList, "#1 "..text, "#2 "..text, "#3 "..text, "#4 "..text)
end

if gridList then -- if the grid list exist then
    local postion = guiGridListGetHorizontalScrollPosition(gridList) -- get the horizontal scroll position
    outputChatBox("Current position of the horizontal scroll:" .. tostring(position) .. "%") -- output to the chatbox
else
    outputChatBox("Grid list not found!") -- if the grid list was not found
end
