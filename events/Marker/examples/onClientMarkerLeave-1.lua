function markerLeave ( leavingPlayer, matchingDimension )
    outputChatBox ( getPlayerName(leavingPlayer) .. " left a marker" )
end

addEventHandler ( "onClientMarkerLeave", getRootElement(), markerLeave )