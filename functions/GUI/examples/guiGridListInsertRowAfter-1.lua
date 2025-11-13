gridlist = guiCreateGridList(100,100,200,100,false)
guiGridListAddColumn(gridlist,"Players",0.50)
for i,v in ipairs(getElementsByType("player"))do
	guiGridListSetItemText(gridlist,guiGridListAddRow(gridlist),1,getPlayerName(v),false,false)
end
addEventHandler("onClientPlayerJoin",root,function()
	guiGridListSetItemText(gridlist,guiGridListInsertRowAfter(gridlist,guiGridListGetRowCount(gridlist)),1,getPlayerName(source),false,false)--Add row at the bottom of the gridlist and name it the players name
end)