gridlist = guiCreateGridList(100,100,200,100,false)
	guiGridListAddColumn(gridlist,"Players",0.50)
	for i,v in ipairs(getElementsByType("player"))do
		guiGridListSetItemText(gridlist,guiGridListAddRow(gridlist),1,getPlayerName(v),false,false)
	end
	for b=0, guiGridListGetRowCount(gridlist)do
		if(string.find(guiGridListGetItemText(gridlist,b,1),"a",1,true))then
			guiGridListSetSelectedItem(gridlist,b,1)
		end
	end
	outputChatBox("The number of Players with 'a' in their name: "..guiGridListGetSelectedCount(gridlist)..".")