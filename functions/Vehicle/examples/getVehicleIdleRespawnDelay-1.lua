addCommandHandler("getVehicleDelay", function(player)
    local veh = getPedOccupiedVehicle(player)
    if not veh then
        outputChatBox('You must be in a vehicle!', player)
        return
    end
    local delay = getVehicleIdleRespawnDelay(veh)
    outputChatBox('Idle vehicle delay: '..delay..'ms', player)
end)