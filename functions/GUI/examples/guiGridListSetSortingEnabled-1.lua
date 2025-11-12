function createGridList ()
	--Create the grid list element
	local newGridlist = guiCreateGridList ( 0.50, 0.50, 0.20, 0.30, true )
	--Create a new grid list
        local column = guiGridListAddColumn( newGridlist, "Players", 0.85 )
	if ( column ) then --If the column has been created, fill it with players
		for id, player in ipairs(getElementsByType("player")) do
			local row = guiGridListAddRow ( newGridlist )
			guiGridListSetItemText ( newGridlist, row, column, getPlayerName ( player ), false, false )
		end
	end
	guiGridListSetSortingEnabled ( newGridlist, false )
        --Disable sorting for the gridlist
end