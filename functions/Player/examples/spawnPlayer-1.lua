-- Get a table of all the players
local players = getElementsByType ( "player" )
-- Go through every player
for _, player in ipairs(players) do
	-- Spawn them at the desired coordinates
	spawnPlayer ( player, 0.0, 0.0, 5.0, 90.0, 0 )
	fadeCamera ( player, true)
	setCameraTarget ( player, player )
end