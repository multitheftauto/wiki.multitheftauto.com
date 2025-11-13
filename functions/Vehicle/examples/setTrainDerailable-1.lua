function derailToggle()
	local vehicle = getPedOccupiedVehicle(localPlayer)

	if not vehicle then return end

	if getVehicleType(vehicle) == "Train" and getVehicleController(vehicle) == localPlayer then
		setTrainDerailable(vehicle, not isTrainDerailable(vehicle))
		outputChatBox("Derailing for this train has been toggled!")
	end
end
addCommandHandler("togglederail", derailToggle)