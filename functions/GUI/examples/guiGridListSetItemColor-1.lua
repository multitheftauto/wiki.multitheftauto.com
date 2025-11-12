function createPlayerList ( )
	--Create the grid list element
	local playerList = guiCreateGridList ( 0.80, 0.10, 0.15, 0.60, true )
	--Create a players column in the list
	local column = guiGridListAddColumn( playerList, "Player", 0.85 )
	if ( column ) then --If the column has been created, fill it with players
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			local row = guiGridListAddRow ( playerList )
			local r, g, b = getPlayerNametagColor ( player ) -- We get the player nametag color.
			guiGridListSetItemText ( playerList, row, column, getPlayerName ( player ), false, false )
			guiGridListSetItemColor ( playerList, row, column, r, g, b ) -- We set the grid list item color to the returned values of getPlayerNametagColor.
		end
	end
end
addEventHandler ( "onClientResourceStart", resourceRoot, createPlayerList )