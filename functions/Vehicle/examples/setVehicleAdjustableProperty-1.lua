function adjustProperty ( command, adjustValue )
    --First check if our player is in a vehicle (otherwise there is nothing to adjust)
    if isPedInVehicle (getLocalPlayer()) then
        --Next check if there is a property to adjust on this vehicle that our player is in
        if getVehicleAdjustableProperty(getPedOccupiedVehicle(getLocalPlayer())) then
            --Set the vehicle property to the argument that was given with the command (adjustValue)
            setVehicleAdjustableProperty (getPedOccupiedVehicle(getLocalPlayer()), adjustValue )
        else
            outputChatBox("You are in a vehicle that has no adjustable property!")
        end
    else
        outputChatBox("You are not in a vehicle!")
    end
end
addCommandHandler ( "adjust", adjustProperty )