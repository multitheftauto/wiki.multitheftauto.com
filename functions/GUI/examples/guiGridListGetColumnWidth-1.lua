grid = guiCreateGridList(313, 354, 162, 100, false)
c = guiGridListAddColumn(grid, "test",0.5)

addCommandHandler("With",function()
With = guiGridListGetColumnWidth(grid ,c, true)
outputChatBox("Column Width = "..With)
end
)