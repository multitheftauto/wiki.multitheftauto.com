local theList = GuiGridList(0.80, 0.10, 0.15, 0.60, true) -- Create the grid list
local column = theList:addColumn("New column", 0.9) -- Create a new column in the grid list
local title = theList:getColumnTitle(theList, column)
print(title) -- "New column"