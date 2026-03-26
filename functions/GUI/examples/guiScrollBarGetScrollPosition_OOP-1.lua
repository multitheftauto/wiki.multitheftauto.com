function OnScroll()
    outputChatBox("The new scroll position is " ..source.scrollPosition)
end
addEventHandler("onClientGUIScroll", root, OnScroll)