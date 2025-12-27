function cloneVehicle(thePlayer, commandName)
    local occupiedVehicle = thePlayer.vehicle -- get the player's vehicle
    if occupiedVehicle then -- If the player is actually in a vehicle
        local x, y, z = occupiedVehicle:getPosition() -- get the vehicle's position
        local clone = occupiedVehicle:clone(x + 5, y, z) -- create a clone of the vehicle near it
    else
        thePlayer:outputChat("You can't clone a vehicle if you're not in a vehicle", 255, 0, 0)
    end
end
addCommandHandler("clone", cloneVehicle)
