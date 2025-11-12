function enteredVehicleType(theVehicle, seat, jacked)
	outputChatBox("You entered ".. getVehicleType(theVehicle) ..".", source)
end

addEventHandler("onPlayerVehicleEnter", root, enteredVehicleType)