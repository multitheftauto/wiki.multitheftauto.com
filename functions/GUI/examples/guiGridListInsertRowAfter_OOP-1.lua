local gridlist = GuiGridList(100,100,200,100,false)
gridlist:addColumn("Foo", 0.75)

gridlist:addRow("Number 1") -- row 0
gridlist:addRow("Number 3") -- row 1
gridlist:insertRowAfter(0, "Number 2")
