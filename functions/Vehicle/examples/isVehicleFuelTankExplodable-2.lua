function toggleFuelTankExplodable(playerSource)
vehicle = getPedOccupiedVehicle(playerSource)
    if vehicle then
        if isVehicleFuelTankExplodable(vehicle) then
            setVehicleFuelTankExplodable(vehicle, false)
        else
            setVehicleFuelTankExplodable(vehicle, true)
        end
    else
        outputChatBox("You are not in a vehicle.", playerSource, 220, 0, 0)
    end
end
addCommandHandler("fueltank", toggleFuelTankExplodable)