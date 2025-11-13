addCommandHandler("hoverme", function()
    local veh = getPedOccupiedVehicle(localPlayer)
    if veh then
        local vehicleId = getElementModel(veh)
        local currentSizes = getVehicleModelWheelSize(vehicleId)
        setVehicleModelWheelSize(vehicleId, "front_axle", currentSizes.front_axle * 2)
        setVehicleModelWheelSize(vehicleId, "rear_axle", currentSizes.rear_axle * 2)
        outputChatBox("Vehicle model wheel size doubled!", 0, 255, 0)
    else
        outputChatBox("You must be in a vehicle to use this command.", 255, 0, 0)
    end
end)