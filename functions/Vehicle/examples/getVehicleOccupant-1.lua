function onStolenVehicleDamage ( loss )
    local driver = getVehicleOccupant ( source ) -- get the player sitting in seat 0
    if ( driver ) then -- if the driver exists, display a message
        outputChatBox ( getPlayerName ( driver ) .. " is wrecking the vehicle he stole!" )
    end
end
addEventHandler ( "onVehicleDamage", stolenVehicle, onStolenVehicleDamage )