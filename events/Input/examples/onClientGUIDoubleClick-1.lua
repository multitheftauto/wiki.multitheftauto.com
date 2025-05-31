addEventHandler( "onClientResourceStart", getResourceRootElement( ),
    function ( )
        gridList = guiCreateGridList( 10, 200, 100, 50, false ) -- create a gridlist
        local col = guiGridListAddColumn( gridList, "Players", .9 ) -- add "Players" column

        local players = getElementsByType( "player" )
        for i, plr in pairs( players ) do -- loop through the table of players
            local row = guiGridListAddRow( gridList ); -- add row for player
            guiGridListSetItemText( gridList, row, col, getPlayerName( plr ), false, false ) -- change the text of the added row
        end

        addEventHandler( "onClientGUIDoubleClick", gridList, doubleClickedName, false )
    end
);

function doubleClickedName( )
    local selectedRow, selectedCol = guiGridListGetSelectedItem( gridList ); -- get double clicked item in the gridlist
    local playerName = guiGridListGetItemText( gridList, selectedRow, selectedCol ) -- get its text
    outputChatBox( "You double-clicked: " .. playerName ) -- display the text taken from gridlist
end