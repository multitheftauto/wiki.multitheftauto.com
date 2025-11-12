local gridList = guiCreateGridList(0.80, 0.10, 0.15, 0.60, true) -- Create the grid list
local column = guiGridListAddColumn(gridList, "New column", 1) -- Create a new column in the grid list
 
if gridList then -- if the grid list exist then
    local postion = guiGridListGetVerticalScrollPosition(gridList) -- get the vertical scroll position
    outputChatBox ( "Current position of the vertical scroll:" ..tostring(position).. "%" ) -- output to the chatbox
else 
    outputChatBox ("Grid list not found!") -- if the grid list was not found
end