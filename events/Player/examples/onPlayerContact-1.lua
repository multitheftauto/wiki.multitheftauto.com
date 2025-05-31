function outputElementType ( prev, current )
	if ( current ) then
		outputChatBox ( "You have hit an "..getElementType ( current ) )
	end
end
addEventHandler ( "onPlayerContact", getRootElement(), outputElementType )