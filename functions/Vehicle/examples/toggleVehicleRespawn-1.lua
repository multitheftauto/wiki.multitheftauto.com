function doNotRespawn ( thePlayer )
    local theVehicle = getPlayerOccupiedVehicle ( thePlayer )
    if ( theVehicle ) then
        toggleVehicleRespawn ( theVehicle, false ) -- tell the server not to respawn this vehicle
    end
end
addCommandHandler("donotrespawn", doNotRespawn)