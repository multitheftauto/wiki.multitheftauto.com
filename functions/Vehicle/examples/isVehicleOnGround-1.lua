function checkVState ( vehicle, seat, jacked )
	vehName = getVehicleName ( vehicle )

	if isVehicleOnGround ( vehicle ) == false then
		outputChatBox ( "You jumped out of a "..vehName.."!", source, 255, 0, 0  )
	end

end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), checkVState )