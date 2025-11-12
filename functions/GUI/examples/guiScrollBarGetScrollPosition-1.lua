function OnScroll( )
	outputChatBox( "The new scroll position is " .. guiScrollBarGetScrollPosition( source ) )
end
addEventHandler( "onClientGUIScroll", root, OnScroll )