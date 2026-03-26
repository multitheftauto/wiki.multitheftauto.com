local grid = GuiGridList(313, 354, 162, 100, false)
local c = grid:addColumn("test", 0.5)

addCommandHandler("width", function()
    local w = grid:getColumnWidth(c, true)
    outputChatBox("Column width = " .. w)
end)
