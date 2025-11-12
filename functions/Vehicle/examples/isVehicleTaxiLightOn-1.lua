function toggleTaxiLight()
   local theVehicle = getPedOccupiedVehicle(localPlayer)
   if theVehicle then
      if localPlayer == getVehicleOccupant(theVehicle, 0) then -- if is a driver
	 local id = getElementModel(theVehicle) -- getting vehicle model
	 if ((id == 420) or (id == 438)) then -- if is a taxi
	    local lights = isVehicleTaxiLightOn(theVehicle) -- getting vehicle lights state
	    setVehicleTaxiLightOn(theVehicle, not lights) -- switch lights
	 end
      end	
   end
end
bindKey("o", "down", toggleTaxiLight) -- binding the function