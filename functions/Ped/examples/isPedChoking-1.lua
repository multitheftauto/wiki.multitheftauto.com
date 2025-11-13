local players = getElementsByType ( "player" )
local randomPlayer = players[math.random(#players)]
if isPedChoking ( randomPlayer ) then
	outputChatBox ( getPlayerName ( randomPlayer ) .. " is choking.  Keep away from those cigarettes!" )
end