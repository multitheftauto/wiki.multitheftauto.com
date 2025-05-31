local myMarker = createMarker(-2596.6259765625, 579.3583984375, 15.626741409302, "cylinder", 2.0, 255, 0, 0, 150)

function markerLeave(leaveElement, matchingDimension)
	local elementType = getElementType(leaveElement)

	if elementType == "player" then
		outputChatBox("Player has left a marker.", root, 255, 255, 0)
	end
end
addEventHandler("onMarkerLeave", myMarker, markerLeave)