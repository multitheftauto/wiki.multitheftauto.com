function createPlayerList ()
        -- Create the grid list
        playerList = guiCreateGridList ( 0.80, 0.10, 0.15, 0.60, true )
        -- Create a players column in the list
        local column = guiGridListAddColumn( playerList, "Player", 0.85 )
        if ( column ) then         -- If the column has been created, fill it with players
                for id, playeritem in ipairs(getElementsByType("player")) do
                        local row = guiGridListAddRow ( playerList )
                        guiGridListSetItemText ( playerList, row, column, getPlayerName ( playeritem ), false, false )
                end
                addEventHandler ( "onClientGUIClick", playerList, click )
        end
end
addEventHandler ( "onClientResourceStart", getRootElement(), createPlayerList )

function click () 
       local playerName = guiGridListGetItemText ( playerList, guiGridListGetSelectedItem ( playerList ), 1 )
       outputChatBox(playerName)
end