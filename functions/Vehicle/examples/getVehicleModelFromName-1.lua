function createVehicleCommand ( thePlayer, commandName, carName )
    -- This function is triggered by the text "spawnvehicle" in the console.
    -- The player must specify the added parameter 'carName' to specify
    -- what car they wish to spawn.
    local carModel = getVehicleModelFromName ( carName )
    -- Get the model ID of the car the player asked for and store it to the
    -- variable 'carModel'
    local x, y, z = getElementPosition ( thePlayer )
    -- Get the position of the player to spawn the car near this location
    if not carModel then
        outputChatBox ( "That is not a valid car name" )
    else
        createVehicle ( carModel, x + 5, y, z )
        -- Spawn the car using its model ID. Spawn it at x + 5 from the player so it doesn't crush him
	outputChatBox ( "A vehicle with model ID of " .. carModel .. " was created!" )
    end
    -- If the entered car name returns no car model ID, the string will be empty and false will be returned.
    -- If the string does have any value, we create the car and announce the car model ID in the chatbox,
    -- because a car did exist under the given car name.
end
addCommandHandler ( "spawnvehicle", createVehicleCommand )