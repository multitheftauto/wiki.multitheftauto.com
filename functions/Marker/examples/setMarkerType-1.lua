function changeAllMarkersType ( newMarkerType )
	-- we store a table with all markers
	local allMarkers = getElementsByType( "marker" )
	-- for each marker in it,
	for index, aMarker in ipairs(allMarkers) do
		-- set its type to the one passed to this function
		setMarkerType( aMarker, newMarkerType )
	end
end