function tankHat(commandName)
    local x,y,z = getElementPosition(localPlayer) -- Get the players position
    local tank = createVehicle(432, x, y, z + 5) -- Create a tank
    attachElements(tank, localPlayer, 0, 0, 5) -- Attach the tank to the player.
end
addCommandHandler("hat", tankHat)
