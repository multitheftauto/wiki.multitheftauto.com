-- Add a new event called onSpecialEvent
addEvent ( "onSpecialEvent", true )

-- Define our handler function, that takes a "text" parameter and outputs it to the chatbox
function specialEventHandler ( text )
	outputChatBox ( text )
end

-- Add it as a handler for our event
addEventHandler ( "onSpecialEvent", root, specialEventHandler )