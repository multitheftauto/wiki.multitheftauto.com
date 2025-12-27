-- Create a vehicle
local myVehicle = Vehicle(411, 0, 0, 3) -- Create an Infernus at coordinates (0, 0, 3)

-- Check if the vehicle is frozen
addCommandHandler("checkfreeze", function(player)
    if myVehicle.frozen then
        player:outputChat("The vehicle is currently frozen.")
    else
        player:outputChat("The vehicle is not frozen.")
    end
end)