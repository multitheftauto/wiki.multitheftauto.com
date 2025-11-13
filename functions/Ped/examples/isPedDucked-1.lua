local players = getElementsByType ( "player" )
local randomPlayer = players[math.random(#players)]
if isPedDucked ( randomPlayer ) then
	outputChatBox ( getPlayerName ( randomPlayer ) .. " is currently crouching." )
end