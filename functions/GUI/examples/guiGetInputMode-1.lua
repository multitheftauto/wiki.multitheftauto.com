addCommandHandler( "checkmode", 
function ()
    outputChatBox( string.format( "The current input mode is: '%s'", guiGetInputMode () ) )
end )