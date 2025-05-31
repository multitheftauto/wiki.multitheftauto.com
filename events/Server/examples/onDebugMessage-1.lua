function onDebugMessage(debugMessage, debugLevel, debugFile, debugLine, debugRed, debugGreen, debugBlue)
	local debugError = (debugLevel == 1)

	if (not debugError) then
		return false
	end

	local debugAtFile = (debugFile and debugFile or "NO_FILE")
	local debugAtLine = (debugLine and debugLine or "NO_LINE")
	local debugChatMessage = "ERROR: "..debugAtFile..":"..debugAtLine..": "..debugMessage

	outputChatBox(debugChatMessage, root, debugRed, debugGreen, debugBlue)
end
addEventHandler("onDebugMessage", root, onDebugMessage)