-- we define the function that will determine if the player is to be healed or killed
function healOrKill ( hitMarker, matchingDimension )
	-- if the marker was in a different dimension, stop here to ignore the event
	if not matchingDimension then
		return
	end
	-- get the marker's color
	local R, G, B, A = getMarkerColor( hitMarker )
	-- if its RGB color is 255,255,255 (white),
	if R == 255 and G == 255 and B == 255 then
		-- heal the player
		setElementHealth( source, 100 )
	-- if it isn't white, but 255,0,0 (red),
	elseif R == 255 and G == 0 and B == 0 then
		-- kill the player
		killPed( source )
	end
end
-- add our function as a handler to "onPlayerMarkerHit"
addEventHandler( "onPlayerMarkerHit", root, healOrKill )