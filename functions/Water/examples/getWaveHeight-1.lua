function scriptWave ( thePlayer, command, height )
	local oldHeight = getWaveHeight()
	height = tonumber ( height )
	success = setWaveHeight ( height )
	if ( success ) then
		outputChatBox ( "The old wave height was: " .. oldHeight .. "; " .. getPlayerName ( thePlayer ) .. " set it to: " .. height )
	else
		outputChatBox ( "Invalid number." )
	end
end
addCommandHandler ( "setwave", scriptWave )