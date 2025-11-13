addCommandHandler("shrinkwheels", function()
    local veh = getPedOccupiedVehicle(localPlayer)
    if veh then
        local newScale = getVehicleWheelScale(veh) * 0.5
        setVehicleWheelScale(veh, newScale)
        outputChatBox("Vehicle wheel scale set to " .. newScale .. ".", 0, 255, 0)
    else
        outputChatBox("You must be in a vehicle to use this command.", 255, 0, 0)
    end
end)