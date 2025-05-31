function exitingVehicle(player, seat, door)
	if (seat==0) and (door==0) then
		outputChatBox("You are leaving the drivers seat.")
	end
end
addEventHandler("onClientVehicleStartExit", getRootElement(), exitingVehicle)