function createVehicleCommand ( thePlayer, commandName, carModel )
    -- This function is triggered by the text "spawnvehicle" in the console.
    -- The player must specify the parameter 'carModel' to specify
    -- what car they wish to spawn.
    local x, y, z = getElementPosition ( thePlayer )
    -- Get the position of the player to spawn the car near this location
    local carName = getVehicleNameFromModel ( tonumber ( carModel ) )
    -- Get the name of the car the player asked for and store it in the
    -- variable 'carName'
    if not carname then
        outputChatBox ( "That is not a valid car model ID", thePlayer )
    else
        createVehicle ( tonumber ( carModel ), x + 5, y, z )
        -- Spawn the car at x + 5 from the player so it doesn't crush him
        outputChatBox ( "A " .. carName .. " was created!" )
    end
    -- If the entered car model ID is invalid, false will be returned.
    -- Otherwise a string is returned, we create the car and announce the car name in the chatbox.
end
addCommandHandler ( "spawnvehicle", createVehicleCommand )