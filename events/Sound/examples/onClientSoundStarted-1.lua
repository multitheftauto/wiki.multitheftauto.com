function onSoundStarted ( reason )
    if ( reason == "play" ) then
        outputChatBox ( "sound started" )
    elseif ( reason == "resumed" ) then
        outputChatBox ( "sound resumed" )
    end
end
addEventHandler ( "onClientSoundStarted", getRootElement(), onSoundStarted )