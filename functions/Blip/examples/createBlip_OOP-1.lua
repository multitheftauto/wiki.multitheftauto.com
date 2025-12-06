-- Pick a random player
local myPlayer = Player.getRandom()
-- Retrieve the player's position and store it in the variables x, y and z
local x, y, z = myPlayer.position
-- Create a radar blip at the player's position, with a 'cash' icon and only visible to the player
local myBlip = Blip(x, y, z, 51, 0, 0, 0, 255, myPlayer)