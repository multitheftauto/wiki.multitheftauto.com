function clientsideResourceStart ()
    --Create a gridlist
    myGridList = guiCreateGridList ( 0.35, 0.35, 0.4, 0.1, true ) 
    --Create a column for myGridList to add rows into
	columnA = guiGridListAddColumn ( myGridList, "columnA Title", 0.3 )
	columnB = guiGridListAddColumn ( myGridList, "columnA Title", 0.3 )
	columnC = guiGridListAddColumn ( myGridList, "columnA Title", 0.3 ) 
	--Create a row for columnA
	rowA = guiGridListAddRow ( myGridList )
	rowB = guiGridListAddRow ( myGridList )
	rowC = guiGridListAddRow ( myGridList )
        --Set the text of columnA, rowA to "Hello World!"
	guiGridListSetItemText ( myGridList, rowA, columnA, "rowA ColumnA", false, false )
	guiGridListSetItemText ( myGridList, rowB, columnA, "rowB ColumnA", false, false )
	guiGridListSetItemText ( myGridList, rowC, columnA, "rowC ColumnA", false, false )
	guiGridListSetItemText ( myGridList, rowA, columnB, "rowA ColumnB", false, false )
	guiGridListSetItemText ( myGridList, rowB, columnB, "rowB ColumnB", false, false )
	guiGridListSetItemText ( myGridList, rowC, columnB, "rowC ColumnB", false, false )
	guiGridListSetItemText ( myGridList, rowA, columnC, "rowA ColumnC", false, false )
	guiGridListSetItemText ( myGridList, rowB, columnC, "rowB ColumnC", false, false )
	guiGridListSetItemText ( myGridList, rowC, columnC, "rowC ColumnC", false, false )
	showCursor ( true )
end
addEventHandler ( "onClientResourceStart", resourceRoot, clientsideResourceStart )  

-- adds the command 'getmode' which will call the function 'getSelectionMode' when typed
function getSelectionMode ( commandName )

    local mode = guiGridListGetSelectionMode( myGridList ) -- get the selection mode from 'myGridList'
    outputChatBox ( "The current gridlist selection mode is "..tostring(mode), 230, 230, 230 ) -- shows in the chatbox the selection mode
end
addCommandHandler ( "getmode", getSelectionMode )