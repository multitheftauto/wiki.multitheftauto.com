-- Find a player called 'someguy'
someGuy = getPlayerFromName ( "someguy" )
-- If a player called someguy was found then
if ( someGuy ) then
	-- Get the player's position
	x, y, z = getElementPosition ( someGuy )
	-- Create a bed (1700) object near to the player
	bed = createObject ( 1700, x + 5, y, z )
	-- Move the bed towards the player over 3 seconds (3000 milliseconds)
	moveObject ( bed, 3000, x, y, z )
	-- Tell the player in the chat box
	outputChatBox ( "Moving a bed towards you!", someGuy )
else
	-- Tell everyone that a player called 'someguy' could not be found
	outputChatBox ( "Player someguy doesn't exist" )
end