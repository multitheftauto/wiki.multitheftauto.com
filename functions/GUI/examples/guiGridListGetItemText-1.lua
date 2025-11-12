function clientsideResourceStart ()
        --Create a gridlist
    	local myGridList = guiCreateGridList ( 0.80, 0.10, 0.15, 0.60, true ) 
    	--Create columnA on the gridlist
		local columnA = guiGridListAddColumn ( myGridList, "columnA Title", 0.85 ) 
    	--Add 2 rows to the grid list
		rowA = guiGridListAddRow ( myGridList )
    	rowB = guiGridListAddRow ( myGridList )
        --Create the text "Hello" for rowA, columnA
		guiGridListSetItemText ( myGridList, rowA, columnA, "Hello", false, false )   	
    	--Create the text "World!" for rowB, columnA
		guiGridListSetItemText ( myGridList, rowB, columnA, "World!", false, false )
    	--Choose randomly which grid list item text to retrieve
        getRandomItem = math.random ( 1, 2 )       
		if getRandomItem == 1 then 
                randomItemData = guiGridListGetItemText ( myGridList, rowA, columnA )
        elseif getRandomItem == 2 then
                randomItemData = guiGridListGetItemText ( myGridList, rowB, columnA )
        end
        --Output the randomly retrieved item text
        outputChatBox ( "My gridlist item text: "..randomItemData ) 
end
addEventHandler ( "onClientResourceStart", resourceRoot, clientsideResourceStart )