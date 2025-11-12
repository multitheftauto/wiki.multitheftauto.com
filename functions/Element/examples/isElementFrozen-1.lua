-- this function freezes or unfreezes the specified player's vehicle, if he's in one
function toggleFreezeStatus ( thePlayer )
	-- get the vehicle element
	local playerVehicle = getPlayerOccupiedVehicle ( thePlayer )

	if playerVehicle then
		-- get the current freeze status
		local currentFreezeStatus = isElementFrozen ( playerVehicle )
		-- get the new freeze status (the opposite of the previous)
		local newFreezeStatus = not currentFreezeStatus
		-- set the new freeze status
		setElementFrozen ( playerVehicle, newFreezeStatus )
	end
end

-- now make this function available as key bind to all players.
-- first, get the list of players
local connectedPlayers = getElementsByType ( "player" )
-- for each one in it,
for i, aPlayer in ipairs(connectedPlayers) do
	-- bind the player's "p" key to the toggleFreezeStatus function
	bindKey ( aPlayer, "p", "down", "Toggle freeze status", toggleFreezeStatus )
end