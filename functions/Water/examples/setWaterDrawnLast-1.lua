function toggleWaterDrawnLast ()
	local bWaterDrawnLast = not isWaterDrawnLast()
	outputChatBox (string.format('setWaterDrawnLast: %s', tostring(bWaterDrawnLast)))
	return setWaterDrawnLast (bWaterDrawnLast)
end
addCommandHandler ('togglewater', toggleWaterDrawnLast)