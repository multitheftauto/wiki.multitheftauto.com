function checkRotor()
    -- We need to check if the player is in a vehicle, and whether or not it is a plane or helicopter
    local vehicle = getPedOccupiedVehicle(localPlayer)
    if (not vehicle or (getVehicleType(vehicle) ~= "Helicopter" and getVehicleType(vehicle) ~= "Plane")) then
        outputChatBox("You are not in a plane or helicopter!", 255, 0, 0)
        return false
    end
    -- And now we show rotor state using a neat ternary expression
    local rotorState = getVehicleRotorState(vehicle)
    outputChatBox("Your vehicle's rotor is "..(rotorState and "spinning" or "stopped").."!", 0, 255, 0)
end
addCommandHandler("rotor", checkRotor)