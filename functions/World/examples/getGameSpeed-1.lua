function gameSpeedValue( )
    local speed = getGameSpeed( )
    outputChatBox( "Game speed is currently set to " .. speed .. "." )
end
addCommandHandler( "gamespeed", gameSpeedValue )