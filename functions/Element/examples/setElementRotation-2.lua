function carRotate( )
    if isPedInVehicle(localPlayer) then -- if the local client is in a vehicle
        localVehicle = getPedOccupiedVehicle(localPlayer)
        if getVehicleController(localVehicle) == localPlayer then -- if the local client is the controller (driver) of the vehicle
            local rotX, rotY, rotZ = getElementRotation(localVehicle) -- get the local client's vehicle rotation
            setElementRotation(localVehicle,rotX,rotY,rotZ+10) -- turn the vehicle 10 degrees clockwise
         end
    end
end
addCommandHandler ( "turn", carRotate )