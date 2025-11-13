function massChange ( me, command, mass )
    local mass = tonumber ( mass ) -- Convert mass to a number
    local veh = getPedOccupiedVehicle ( me ) -- Get the player's vehicle
    
    if mass and veh then  -- If valid mass and in a vehicle
        local success = setVehicleHandling ( veh, "mass", mass) -- Set the vehicle's mass, and check if successful
        
        if success then -- If successful
            outputChatBox ( "Your vehicle's mass has been changed to: "..mass.." kg", me, 0, 255, 0 ) -- Notify the player of success
        else -- Too bad failure is still an option
            outputChatBox ( "Setting mass failed. It's probably above or below allowed limits", me, 255, 0, 0 ) -- Notify the player of failure, and give a possible reason
        end
    elseif not veh then -- If not in a vehicle
        outputChatBox ( "You're not in a vehicle", me, 255, 0, 0 ) -- Tell the player; He / she obviously doesn't know
    elseif not mass then -- If not a valid mass
        outputChatBox ( "Syntax: /changemass [mass]", me, 255, 0, 0 ) -- Tell the player the proper syntax
    end
end
addCommandHandler ( "changemass", massChange )