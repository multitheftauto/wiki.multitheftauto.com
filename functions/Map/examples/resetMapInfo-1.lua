function onResourceStop()
	resetMapInfo()
end
addEventHandler("onResourceStop", resourceRoot, onResourceStop)