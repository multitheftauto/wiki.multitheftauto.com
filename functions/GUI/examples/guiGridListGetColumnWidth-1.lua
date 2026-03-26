local grid = guiCreateGridList(313, 354, 162, 100, false)
local c = guiGridListAddColumn(grid, "test", 0.5)

addCommandHandler("width", function()
    local w = guiGridListGetColumnWidth(grid, c, true)
    outputChatBox("Column width = " .. w)
end)
