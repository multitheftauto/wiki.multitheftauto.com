function checkVehicles(theVehicle)
	outputChatBox("You entered a "..getVehicleName(theVehicle).."!")
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, checkVehicles)