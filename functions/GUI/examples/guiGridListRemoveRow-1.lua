local myGridList

function deleteRow()
    -- Choose randomly which row to delete, output the
    -- chosen row into the chat box, and delete the row
    local randomDeletion = math.random(0, 1)
    if randomDeletion == 0 then
        outputChatBox("Removing row A")
    elseif randomDeletion == 1 then
        outputChatBox("Removing row B")
    end

	guiGridListRemoveRow(myGridList, randomDeletion)
end

function clientsideResourceStart()
    -- Create a gridlist
    myGridList = guiCreateGridList(0.30, 0.10, 0.5, 0.60, true)
    -- Create a column for myGridList to add rows into
    local columnA = guiGridListAddColumn(myGridList, "columnA Title", 0.25)
    -- Create 2 rows for ColumnA and set the text for them
    local rowA = guiGridListAddRow(myGridList)
    guiGridListSetItemText(myGridList, rowA, columnA, "Hello", false, false)

    local rowB = guiGridListAddRow(myGridList)
    guiGridListSetItemText(myGridList, rowB, columnA, "World!", false, false)
	
    -- Trigger the function to delete a row 3 seconds after the script starts
    setTimer(deleteRow, 3000, 1)
end
addEventHandler("onClientResourceStart", resourceRoot, clientsideResourceStart)
