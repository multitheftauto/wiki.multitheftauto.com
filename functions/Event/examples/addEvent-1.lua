-- Add a new event called onSpecialEvent
addEvent ( "onSpecialEvent", true )

-- Define our handler function, that takes a "text" parameter and outputs it to the chatbox
function specialEventHandler ( text )
	outputChatBox ( text )
end

-- Add it as a handler for our event
addEventHandler ( "onSpecialEvent", root, specialEventHandler )

-- You can then trigger this event later on using:
triggerEvent ( "onSpecialEvent", root, "test" )
-- This will cause the handler to be triggered, so "test" will be output to the chatbox.