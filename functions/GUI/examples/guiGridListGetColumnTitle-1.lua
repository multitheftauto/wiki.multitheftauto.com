local theList = guiCreateGridList(0.80, 0.10, 0.15, 0.60, true) -- Create the grid list
local column = guiGridListAddColumn(theList, "New column", 0.9) -- Create a new column in the grid list
  
function GetColumnTitle()
  if column then 
    local ColumnTitle = guiGridListGetColumnTitle(theList,column) 
    outputChatBox("The Column Title Is: "..ColumnTitle, 0, 255, 0)--Get The column title in the chat
  end 
end
addCommandHandler("GetTitle", GetColumnTitle)