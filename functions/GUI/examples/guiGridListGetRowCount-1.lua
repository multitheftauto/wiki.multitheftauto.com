function onClientResourceStart ()
        -- Create the grid list element
        local playerList = guiCreateGridList ( 0.80, 0.10, 0.15, 0.60, true ) 
        -- Create a players column in the list
        local column = guiGridListAddColumn( playerList, "Player", 0.85 ) 
        if ( column ) then -- If the column was successfully created
                --Loop through adding players to the grid list
                for id, playeritem in ipairs(getElementsByType("player")) do 
                        local row = guiGridListAddRow ( playerList )
                        guiGridListSetItemText ( playerList, row, column, getPlayerName ( playeritem ), false, false )
                end
                outputChatBox ( "Number of player list rows: " .. guiGridListGetRowCount ( playerList ) )
        end
end
addEventHandler ( "onClientResourceStart", resourceRoot, onClientResourceStart )