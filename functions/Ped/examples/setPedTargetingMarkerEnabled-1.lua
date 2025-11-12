function disableTargetMarkers()
	setPedTargetingMarkerEnabled(false) -- Disables target markers from being rendered after the resource is started
end
addEventHandler("onClientResourceStart", resourceRoot, disableTargetMarkers)