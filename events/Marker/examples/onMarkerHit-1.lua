local playerMarker = createMarker(0, 0, 2, "cylinder", 5, 10, 244, 23, 200, root)

function handlePlayerMarker(hitElement)
	local elementType = getElementType(hitElement)

	outputChatBox("Element ("..elementType..") has entered marker.")
end
addEventHandler("onMarkerHit", playerMarker, handlePlayerMarker)