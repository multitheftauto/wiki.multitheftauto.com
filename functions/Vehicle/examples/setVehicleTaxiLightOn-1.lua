function toggleTaxiLight()
	local vehicle = getPedOccupiedVehicle(localPlayer)
		if vehicle and getVehicleController(vehicle) == localPlayer then
		local vehModel = getElementModel(vehicle)
			if (vehModel) == 420 or (vehModel) == 438 then
			setVehicleTaxiLightOn (vehicle, not isVehicleTaxiLightOn(vehicle))
		else
			outputChatBox ("You're not in a Taxi!", 255, 0, 0, true)
		end
	end 
end
addCommandHandler("taxilight",toggleTaxiLight)