addCommandHandler("toggleRespawn",function(player)
    for _,vehicle in ipairs(getElementsByType('vehicle')) do
        toggleVehicleRespawn(vehicle, not isVehicleRespawnable(vehicle))
    end

    outputChatBox('Vehicles respawn state has been changed!', player)
end)