-- *****************************************************************************
-- SERVER CODE
 greetingCommand ( playerSource, commandName )
    triggerClientEvent ( playerSource, "onGreeting", playerSource, "Hello World!" )
end
addCommandHandler ( "greet", greetingCommand )

-- *****************************************************************************
-- CLIENT CODE
function greetingHandler ( message )
    outputChatBox ( "The server says: " .. message )
end
addEvent( "onGreeting", true )
addEventHandler( "onGreeting", localPlayer, greetingHandler )