-- Pick a random player
local myPlayer = getRandomPlayer( )
-- Retrieve the player's position and store it in the variables x, y and z
local x, y, z = getElementPosition( myPlayer )
-- Create a radar blip at the player's position, with a 'cash' icon and only visible to the player
local myBlip = createBlip( x, y, z, 51, 0, 0, 0, 255, myPlayer )