function scriptCreateTank ( commandName )
      local x, y, z = getElementPosition ( localPlayer ) -- retrive the player's position
      createVehicle ( 432, x, y, z + 10 ) -- create the tank 10 units above them
      outputChatBox ( "You got Tank'd!", 255, 0, 0)
end
--Attach the 'scriptCreateTank' function to the "tank" command
addCommandHandler ( "tank", scriptCreateTank )