function scriptCreateTank ( player, command )
      local luckyBugger = getRandomPlayer() -- get a random player
      local x, y, z = getElementPosition ( luckyBugger ) -- retrive the player's position
      createVehicle ( 432, x, y, z + 10 ) -- create the tank 10 units above them
      outputChatBox ( "You got Tank'd!", luckyBugger )
end
--Attach the 'scriptCreateTank' function to the "tank" command
addCommandHandler ( "tank", scriptCreateTank )