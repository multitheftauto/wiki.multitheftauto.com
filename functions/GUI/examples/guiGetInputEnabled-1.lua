addCommandHandler( "checkinput", function ()
    if guiGetInputEnabled( ) then
        outputChatBox( "Your input focus is currently on GUI." )
    else 
        outputChatBox( "Your input focus is currently on game." )
    end
end )