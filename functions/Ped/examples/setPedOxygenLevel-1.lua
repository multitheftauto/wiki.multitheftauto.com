function fillOxygen ( command )
	local maxOxygen = math.floor ( 1000 + getPedStat ( localPlayer, 22 ) * 1.5 + getPedStat ( localPlayer, 225 ) * 1.5 )
	setPedOxygenLevel ( localPlayer, maxOxygen )
end
addCommandHandler ( "filloxygen", fillOxygen )