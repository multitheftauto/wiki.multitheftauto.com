function outputLocalPlayerPosition()
	-- get the local player's position
	local px, py, pz = getElementPosition(localPlayer)
	-- output it to the console
	outputConsole("Your location: "..px.." "..py .." "..pz)
end