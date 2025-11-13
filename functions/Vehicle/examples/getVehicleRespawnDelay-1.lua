addCommandHandler("getVehicleDelay", function(player)
    local veh = getPedOccupiedVehicle(player)
    if not veh then
        outputChatBox('You must be in a vehicle!', player)
        return
    end
    local delay = getVehicleRespawnDelay(veh)
    outputChatBox('Vehicle delay: '..delay..'ms', player)
end)