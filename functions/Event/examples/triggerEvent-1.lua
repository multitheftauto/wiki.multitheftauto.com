function onCustomEvent(chatMessage)
	outputChatBox(chatMessage)
end
addEvent("onCustomEvent", false) -- set to false, so this event won't be called from counter side - important security measure
addEventHandler("onCustomEvent", root, onCustomEvent)