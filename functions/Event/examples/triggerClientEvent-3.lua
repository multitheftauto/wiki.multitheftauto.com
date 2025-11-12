function greetingHandler ( message )
    outputChatBox ( "The server says: " .. message )
end
addEvent( "onGreeting", true )
addEventHandler( "onGreeting", localPlayer, greetingHandler )