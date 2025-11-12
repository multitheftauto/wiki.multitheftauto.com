function toggleEngine()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle and getVehicleController(vehicle) == localPlayer then
		setVehicleEngineState(vehicle, not getVehicleEngineState(vehicle))
	end
end
addCommandHandler("engine", toggleEngine)