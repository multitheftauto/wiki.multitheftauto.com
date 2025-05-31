function onQuitGame( reason )
    outputChatBox ( getPlayerName( source ).." has left the server ("..reason..")" )
end
addEventHandler( "onClientPlayerQuit", getRootElement(), onQuitGame )