local gridlist = GuiGridList(332, 195, 286, 249, false)
local column = gridlist:addColumn("My column", 0)

if (column) then
	gridlist:setColumnWidth(column, 0.5, true)
end
