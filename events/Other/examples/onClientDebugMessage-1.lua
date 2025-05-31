function onClientDebugMessage(message, level, file, line)
	outputConsole(message)
end
addEventHandler("onClientDebugMessage", root, onClientDebugMessage)