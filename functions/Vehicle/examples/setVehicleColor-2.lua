addCommandHandler("banshee", function(player)
    local x, y, z = getElementPosition(player)
    local rx, ry, rz = getElementRotation(player)
    local vehicle = createVehicle(429, x, y, z, 0.0, 0.0, rz, "PALETTE")
    setVehicleColor(vehicle, 3, 1, 0, 0)-- A red and white Banshee!
    addVehicleUpgrade(vehicle, 1010)
    warpPedIntoVehicle(player, vehicle, 0)
    outputChatBox("You have spawned a red and white Banshee! I also added NOS for you!", source, 50, 168, 82)
end)