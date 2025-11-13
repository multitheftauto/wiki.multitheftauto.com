function showOxygen ( command )
	local oxygen = getPedOxygenLevel ( localPlayer )
	outputChatBox( "Your oxygen level: " .. oxygen )
end
addCommandHandler ( "showoxygen", showOxygen )