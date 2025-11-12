local curMaxPlayers = getMaxPlayers()
local newMaxPlayers = math.ceil( curMaxPlayers / 2 )

setMaxPlayers( newMaxPlayers )