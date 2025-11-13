function greetingCommand ( playerSource, commandName )
    triggerClientEvent ( playerSource, "onGreeting", playerSource, "Hello World!" )
end
addCommandHandler ( "greet", greetingCommand )