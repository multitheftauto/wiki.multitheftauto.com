addEvent ( "onSpecialEvent", true )

function specialEventHandler ( text )
	outputChatBox ( text )
end
addEventHandler ( "onSpecialEvent", root, specialEventHandler )