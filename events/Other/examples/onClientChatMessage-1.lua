function onClientChatMessageHandler(text)
	if string.match(text,"%d+") --[[string.match searches for pattern "%d+", means decimals]] == text then -- if string.match and text itself are the same
		cancelEvent() -- don't output it
	end
end
addEventHandler("onClientChatMessage", root, onClientChatMessageHandler)