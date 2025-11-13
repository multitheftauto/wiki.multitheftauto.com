function rotorStartStop()
    -- We need to check if the player is in a vehicle, and whether or not it is a plane or helicopter
    local vehicle = getPedOccupiedVehicle(localPlayer)
    if (not vehicle or (getVehicleType(vehicle) ~= "Helicopter" and getVehicleType(vehicle) ~= "Plane")) then
        outputChatBox("You are not in a plane or helicopter!", 255, 0, 0)
        return false
    end
    -- Set the rotor state depending on previous state and give a message
    local rotorState = getVehicleRotorState(vehicle)
    if (rotorState) then
        setVehicleRotorState(vehicle, false)
        outputChatBox("Your vehicle's rotor has been stopped, you will now drop out of the sky!", 255, 0, 0)
    else
        setVehicleRotorState(vehicle, true)
        outputChatBox("Your vehicle's rotor has been started up, fly away!", 0, 255, 0)
    end
end
addCommandHandler("rotorstart", rotorStartStop) -- Add our command handler