function tankHat (commandName)
   local position = Vector3(getElementPosition (localPlayer)) -- Get the players position
   local tank = createVehicle ( 432, position.x, position.y, position.z + 5 ) -- Create a tank
   attachElements (tank,localPlayer, 0, 0, 5 ) -- Attach the tank to the player.
end
addCommandHandler( "hat", tankHat )