function getMyVehicleVariants()
    local myVeh = getPedOccupiedVehicle(localPlayer) -- Get the vehicle that the player is in

    if myVeh then
        local variant1, variant2 = getVehicleVariant (myVeh) -- Get the vehicle variants

        outputChatBox ("This vehicle's variants are: "..tostring (variant1).." "..tostring (variant2)) -- Output the info to chatbox
    end
end

addCommandHandler ("getvehvar", getMyVehicleVariants)