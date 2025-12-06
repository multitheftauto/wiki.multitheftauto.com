-- Pick a random player
local myPlayer = getRandomPlayer()
-- Create a radar blip in the middle of the map
local myBlip = createBlip(0, 0, 0)
-- Make the player the parent of the blip, so that the blip follows the player around
setElementParent(myBlip, myPlayer)
