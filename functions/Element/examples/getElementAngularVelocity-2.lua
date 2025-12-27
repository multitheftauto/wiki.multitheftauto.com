addCommandHandler("getangularvelocity", function(sourcePlayer, commandName)
    local veh = getPedOccupiedVehicle(sourcePlayer)
    if (not veh) then
        return
    end

    local aX, aY, aZ = getElementAngularVelocity(veh)
    outputChatBox("Your vehicle current angular velocity is: X: " .. aX .. " Y: " .. aY .. " Z: " ..aZ, sourcePlayer)
end)
