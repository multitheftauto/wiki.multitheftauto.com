-- create the grid list
local list = GuiGridList(0.80, 0.40, 0.15, 0.35, true)
-- add three columns to the grid list
list:addColumn("Column 1", 0.33)
list:addColumn("Column 2", 0.33)
list:addColumn("Column 3", 0.33)

-- display the number of columns in the grid list in the debug (/debugscript 3)
print("Number of columns: " .. list.columnCount)