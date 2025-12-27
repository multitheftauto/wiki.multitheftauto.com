local stringToBoolean = {["true"] = true, ["false"] = false}

addCommandHandler("fireelement", function(sourcePlayer, commandName, fireState)
    -- if the player didn't complete the command.
    if not (fireState) then
        local text = string.format("[Usage]: #FFFFFF/%s [%s]", commandName, "State")

        return outputChatBox(text, sourcePlayer, 255, 100, 100, true)
    end

    -- the state will automatically be a string so we change it to boolean.
    local fireState = stringToBoolean[fireState]

    -- if the state isn't boolean then we return it.
    if type(fireState) ~= "boolean" then
        return outputChatBox("[Error]: #FFFFFFThe state has to be true or false.", sourcePlayer, 255, 100, 100, true)
    end

    local playerVehicle = getPedOccupiedVehicle(sourcePlayer)

    if playerVehicle then -- if the player is in a vehicle
        setElementOnFire(playerVehicle, fireState)
    else -- if the player is not in a vehicle
        setElementOnFire(sourcePlayer, fireState)
    end
end, false, false)
