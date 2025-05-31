addEventHandler("onClientTrailerDetach",root,function(towedBy)
	player = getVehicleOccupant(towedBy,0)
	outputChatBox("The vehicle is now detached.",player)
end)