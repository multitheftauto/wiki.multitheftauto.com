-- create the grid list
local list = guiCreateGridList(0.80, 0.40, 0.15, 0.35, true)
-- add three columns to the grid list
guiGridListAddColumn(list, "Column 1", 0.33)
guiGridListAddColumn(list, "Column 2", 0.33)
guiGridListAddColumn(list, "Column 3", 0.33)

-- display the number of columns in the grid list in the debug (/debugscript 3)
print("Number of columns: " .. guiGridListGetColumnCount(list))