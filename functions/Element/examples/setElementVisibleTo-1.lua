-- Find the player called someguy
local someguy = getPlayerFromName ( "someguy" )
-- If the player was found then
if ( someguy ) then
	-- Get the player's position into the variables x, y and z
	x, y, z = getElementPosition ( someguy )
	-- Create a marker at the player's position
	myMarker = createMarker ( x, y, z )
	
	-- Then make the marker invisible to the whole dimension (root for the first)
	setElementVisibleTo ( myMarker, root, false )
	-- Set marker visibility to true for someguy
	setElementVisibleTo ( myMarker, someguy, true )
	
	-- The order in which you do the visibility changes does not matter, but ideally trues should be set before falses in order to prevent a momentary flicker.
end