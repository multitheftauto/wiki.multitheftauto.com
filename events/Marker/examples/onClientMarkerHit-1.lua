function MarkerHit ( hitPlayer, matchingDimension )
	outputChatBox ( getPlayerName(hitPlayer) .. " entered a marker" )
end
addEventHandler ( "onClientMarkerHit", getRootElement(), MarkerHit )