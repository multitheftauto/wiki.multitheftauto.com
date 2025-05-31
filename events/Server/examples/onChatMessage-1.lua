function onChatMessageHandler(theMessage, thePlayer)
	outputDebugString(theMessage)
end
addEventHandler("onChatMessage", root, onChatMessageHandler)