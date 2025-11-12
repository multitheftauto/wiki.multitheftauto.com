function handleResourceStart( )
    outputChatBox( string.format( "Server's aircraft max velocity is set to %.1f", getAircraftMaxVelocity() ) )
end
addEventHandler( "onResourceStart", resourceRoot, handleResourceStart )