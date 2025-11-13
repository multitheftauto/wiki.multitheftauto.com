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

--The player types 'setmode' to activate this function. Additionaly, the player needs
--to type a modeNumber. Ex: 'setmode 5', 5 would be stored as modeNumber
function setSelectionMode ( commandName, modeNumber )
	--The player enters the command "setmode #". The modeNumber entry will be a string
	--argument. Ex: "9" "nine". Attempt to change modeNumber into a number argument.
	modeNumber = tonumber(modeNumber)
	--If the selection mode was successfully changed, output a message saying which
	--mode it changed to. Otherwise, list reasons why it did not work.
        if ( guiGridListSetSelectionMode ( myGridList, modeNumber ) ) then
		outputChatBox ( "Changed grid list selection mode to: "..modeNumber )
	else                                                                        
		outputChatBox ( "modeNumber must be a number and be between 0 and 9" )
	end
end
addCommandHandler ( "setmode", setSelectionMode )