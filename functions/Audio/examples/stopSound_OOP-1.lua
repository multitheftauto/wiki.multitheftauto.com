function startMySound()
    sound = Sound( "sound.mp3", true )
end
addEventHandler( "onClientResourceStart", resourceRoot, startMySound )

function stopMySound()
    sound:stop()
end
addCommandHandler ( "stopsound", stopMySound ) --using the command 'stopsound' will stop the sound