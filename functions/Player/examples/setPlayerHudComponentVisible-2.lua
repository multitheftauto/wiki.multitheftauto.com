function toggleRadar()
	state = not state
	setPlayerHudComponentVisible("radar", state)
end
addCommandHandler( "toggleradar", toggleRadar)