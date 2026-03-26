local myGridList

function deleteColumn()
    -- Choose randomly which column to delete, output the chosen column into the chat box, and delete the column
    local randomIndex = math.random(1, 4)
    outputChatBox("Removing column "..randomIndex)
    guiGridListRemoveColumn(myGridList, randomIndex)
end

function clientsideResourceStart()
    -- Create a gridlist
    myGridList = guiCreateGridList(0.30, 0.10, 0.5, 0.60, true)
	
    -- Create 4 columns for myGridList
    guiGridListAddColumn(myGridList, "columnA Title", 0.25)
    guiGridListAddColumn(myGridList, "columnB Title", 0.25)
    guiGridListAddColumn(myGridList, "columnC Title", 0.25)
    guiGridListAddColumn(myGridList, "columnD Title", 0.25)

    -- Set a timer to trigger the deleteColumn function 3 seconds after the script starts
    setTimer(deleteColumn, 3000, 1)
end
addEventHandler("onClientResourceStart", resourceRoot, clientsideResourceStart)
