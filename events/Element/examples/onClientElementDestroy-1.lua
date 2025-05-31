addEventHandler("onClientElementDestroy", root, function()
	if getElementType(source) == "vehicle" and getPedOccupiedVehicle(localPlayer) == source then
		outputChatBox("The vehicle that you were in has been destroyed by the script")
	end
end)