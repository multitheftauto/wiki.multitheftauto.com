addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		--Create the grid list element
		newGridlist = guiCreateGridList ( 0.50, 0.50, 0.20, 0.30, true )
		--Create a new grid list
		column = guiGridListAddColumn( newGridlist, "Players", 0.85 )
		showCursor( true )

		if ( column ) then --If the column has been created, fill it with players
			for id, player in ipairs(getElementsByType("player")) do
				local row = guiGridListAddRow ( newGridlist )
				guiGridListSetItemText ( newGridlist, row, column, getPlayerName ( player ), false, false )
			end
		end
	end
)

function toggleGridlistSortingState()

	local newStatus = not guiGridListIsSortingEnabled( newGridlist )

	outputChatBox( "The gridlist sorting is now ".. (newStatus and "Enabled" or "Disabled"), 230,230,230 )
	guiGridListSetSortingEnabled( newGridlist, newStatus ) -- Toggles the sorting for the gridlist
end
addCommandHandler( "togglesorting", toggleGridlistSortingState )