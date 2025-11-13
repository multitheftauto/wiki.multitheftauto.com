function clientsideResourceStart ()
        local playerList = guiCreateGridList ( 0.80, 0.10, 0.15, 0.60, true ) -- Create the grid list
        local column = guiGridListAddColumn( playerList, "Player", 0.85 ) -- Create a 'players' column in the list
        if ( column ) then -- If the column was successfully created
                for id, playeritem in ipairs(getElementsByType("player")) do 
                --Loop through all the players, adding them to the table
                        local row = guiGridListAddRow ( playerList )
                        guiGridListSetItemText ( playerList, row, column, getPlayerName ( playeritem ), false, false )
                end
        end
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(), clientsideResourceStart )