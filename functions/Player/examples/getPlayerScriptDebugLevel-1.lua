function showdebug (player)
    local level = getPlayerScriptDebugLevel( player )
    outputChatBox( "Your Script Debug Level: " .. level )
end
addCommandHandler ( "showdebug", showdebug )