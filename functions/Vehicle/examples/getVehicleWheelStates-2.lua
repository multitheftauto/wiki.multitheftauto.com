function scriptWheelStates (command, newFLeft, newRLeft, newFRight, newRRight )
    local theVehicle = getPedOccupiedVehicle ( localPlayer )
    if ( theVehicle ) then      -- check if the player is in a car
        if ( newFLeft ) then    -- if there's at least one argument passed, we change the wheel states
            if not setVehicleWheelStates ( theVehicle, newFLeft, newRLeft, newFRight, newRRight ) then
                outputChatBox ( "Bad arguments." )
            end
        end
        local states = { [0]="inflated", [1]="flat", [2]="fallen off" }    -- we store the states in a table
        local frontLeft, rearLeft, frontRight, rearRight = getVehicleWheelStates ( theVehicle )
        outputChatBox ( "Your vehicle's wheel states:", localPlayer )        -- output them in the chatbox
        outputChatBox ( "Front-Left: " .. states [ frontLeft ] .. ", Front-Right: " .. states [ frontRight ] ..
           ", Rear-Left: " .. states [ rearLeft ] .. ", Rear-Right: " .. states [ rearRight ], localPlayer )
    else
        outputChatBox ( "You have to be in a vehicle to use this command.", localPlayer )
    end
end
addCommandHandler ( "wheelstates", scriptWheelStates )