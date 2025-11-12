function enableDebug()
	local state = not isDebugViewActive()
	setDebugViewActive(state)
end
addCommandHandler("debug", enableDebug)