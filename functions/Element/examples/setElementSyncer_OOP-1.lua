addCommandHandler("createMyVehicle", function(player, command)
    local myVehicle = Vehicle(411, player.position)
    myVehicle.syncer = player
end)
