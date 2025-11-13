-- Find the player called someguy
local someguy = getPlayerFromName ( "someguy" )
local anotherguy = getPlayerFromName ( "anotherguy" )
-- If the player was found then
if ( someguy ) then
	-- Get the player's position into the variables x, y and z
	x, y, z = getElementPosition ( someguy )
	-- Create a marker at the player's position
	myMarker = createMarker ( x, y, z )
	attachElements(myMarker, someguy)

	-- First make sure everyone is able to see the marker, this line is unnecessary in this case as root visibility is set to true by default behaviour
	setElementVisibleTo ( myMarker, root, true )

	-- Then hide it from anotherguy
	setElementVisibleTo ( myMarker, anotherguy, false )
end