function newDebug()
	if not isDebugViewActive() then -- If their debug view is not active
		outputChatBox("* You just missed a debug message. Use the \'/debugscript\' command to view it.", 255, 0, 0) -- Output to them that they missed a debug message
	end
end
addEventHandler("onClientDebugMessage", root, newDebug) -- When we get a new client debug message, call the newDebug function