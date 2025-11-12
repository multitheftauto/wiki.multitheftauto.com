function showMapOpacity()
	-- We get the map opacity value
	local mapOpacity = getPlayerMapOpacity()
	-- We tell what the map opacity is to the player
	outputChatBox("Your map's opacity is at "..mapOpacity, 0, 255, 0)
end
addCommandHandler("mapopacity", showMapOpacity)