function onSoundStopped ( reason )
    if ( reason == "destroyed" ) then
        outputChatBox ( "sound destroyed" )
    elseif ( reason == "finished" ) then
        outputChatBox ( "end of sound" )
    elseif ( reason == "paused" ) then
        outputChatBox ( "sound paused" )
    end
end
addEventHandler ( "onClientSoundStopped", getRootElement(), onSoundStopped )