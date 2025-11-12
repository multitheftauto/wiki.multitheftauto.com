function deleteColumn ()
        --Choose randomly which column to delete, output the chosen column into the chat box, and delete the column
    	randomDeletion = math.random ( 1, 4 )   
		if randomDeletion == 1 then
		        outputChatBox ( "Removing column A" )
		        guiGridListRemoveColumn ( myGridList, columnA )
		elseif randomDeletion == 2 then    
		        outputChatBox ( "Removing column B" )
		        guiGridListRemoveColumn ( myGridList, columnB )
		elseif randomDeletion == 3 then
		        outputChatBox ( "Removing column C" )
		        guiGridListRemoveColumn ( myGridList, columnC )
		else
		        outputChatBox ( "Removing column D" )
		        guiGridListRemoveColumn ( myGridList, columnD )
		end
end


function clientsideResourceStart ()
	--Create a gridlist
    	myGridList = guiCreateGridList ( 0.30, 0.10, 0.5, 0.60, true ) 
    	--Create 4 columns for myGridList
	columnA = guiGridListAddColumn ( myGridList, "columnA Title", 0.25 ) 
	columnB = guiGridListAddColumn ( myGridList, "columnB Title", 0.25 )
	columnC = guiGridListAddColumn ( myGridList, "columnC Title", 0.25 )
    	columnD = guiGridListAddColumn ( myGridList, "columnD Title", 0.25 )	
   	--Set a timer to trigger the deleteColumn function 3 seconds after the script starts
        setTimer ( deleteColumn, 3000, 1 )
end
addEventHandler ( "onClientResourceStart", resourceRoot, clientsideResourceStart )