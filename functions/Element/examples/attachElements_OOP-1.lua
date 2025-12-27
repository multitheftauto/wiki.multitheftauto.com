function tankHat(source, commandName)
    local pos = source.position -- Get the players position
    local tank = Vehicle(432, pos.x, pos.y, pos.z + 5) -- Create a tank
    tank:attach(source, 0, 0, 5) -- Attach the tank to the player.
end
addCommandHandler("hat", tankHat)
