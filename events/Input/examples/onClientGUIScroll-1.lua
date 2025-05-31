function onClientGUIScroll(scrollBar)
	outputChatBox("The new scroll position is "..guiScrollBarGetScrollPosition(scrollBar))
end
addEventHandler("onClientGUIScroll", root, onClientGUIScroll)