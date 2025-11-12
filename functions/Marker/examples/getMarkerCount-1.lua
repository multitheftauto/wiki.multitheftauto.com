function howManyMarkers(thePlayer,command)
	local ammount = getMarkerCount()
	outputChatBox("There are "..ammount.." markers.",thePlayer,255,255,0)
end
addCommandHandler("markers",howManyMarkers)