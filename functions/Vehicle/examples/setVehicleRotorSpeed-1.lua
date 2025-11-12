addCommandHandler("rs", function()
	local theVehicle = getPedOccupiedVehicle(localPlayer)
	if not theVehicle then return end

	local controller = getVehicleController(theVehicle)
	if controller ~= localPlayer then return end

	local vehicleType = getVehicleType(theVehicle)
	if vehicleType ~= "Helicopter" and vehicleType ~= "Plane" then return end
   	setVehicleRotorSpeed(theVehicle, 10)
end)