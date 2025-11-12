function setMyVehicleVariants (thePlayer, commandName, arg1, arg2)
    local variant1, variant2 = tonumber (arg1), tonumber (arg2) -- If anything was passed make sure the arguments are numbers or pass nil
    local myVeh = getPedOccupiedVehicle (thePlayer) -- Get the vehicle that the player is in

    if (myVeh and getVehicleController (myVeh) == thePlayer) then -- Make sure the player is the vehicle driver (controller)
        local wasSet = setVehicleVariant (myVeh, variant1, variant2) -- Set the vehicle variants the player passed as arguments

        if wasSet then
            outputChatBox ("Vehicle variant successfully set!", thePlayer, 0, 255, 0)
        else
            outputChatBox ("Vehicle variant unsuccessfully set.", thePlayer, 255, 255, 0)
        end
    end
end

addCommandHandler ("setvehvar", setMyVehicleVariants) -- Create the command