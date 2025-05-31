function outputSpawn( )
    local area = getElementZoneName( source ) -- Get the area name where the pickup spawned
    local city = getElementZoneName( source, true ) -- Get the city name where the pickup spawned
    outputChatBox( "A pickup has spawned in " .. area .. " ( " .. city .. " )", root, 255, 0, 0 ) -- Output a message to the chatbox
end
addEventHandler( "onPickupSpawn", root, outputSpawn ) -- Trigger the function when a pickup spawns