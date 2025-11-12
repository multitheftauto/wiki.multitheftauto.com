function rotorSpeed() 
    local theVehicle = getPedOccupiedVehicle (localPlayer)
    if theVehicle then 
      local controller = getVehicleController (theVehicle)
        if controller == localPlayer then 
          local vehicleType = getVehicleType(theVehicle)
	  if vehicleType == "Helicopter" or vehicleType == "Plane" then 
             outputChatBox("Your vehicle rotor speed: "..math.ceil(getVehicleRotorSpeed(theVehicle)),0,255,0)
          end 
       end 
   end 
end
addCommandHandler("grs",rotorSpeed)