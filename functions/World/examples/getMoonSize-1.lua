function handleResourceStart( )
    outputChatBox( string.format( "Server's moon size is set to %d", getMoonSize() ) )
end
addEventHandler( "onResourceStart", resourceRoot, handleResourceStart )