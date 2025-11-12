local gridlist = guiCreateGridList ( 332, 195, 286, 249, false ) 
local column = guiGridListAddColumn ( gridlist, "My column", 0 )

if column then
	guiGridListSetColumnWidth ( gridlist, column, 0.5, true)
end