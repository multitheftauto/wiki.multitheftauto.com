local distance = 5 --units

-- define our handler (we'll take a variable number of parameters where the name goes, because there are vehicle names with more than one word)
function consoleCreateVehicle ( sourcePlayer, commandName, ... )
   -- if a player triggered it, not the admin,
   if ( sourcePlayer ) then
      -- calculate the position of the vehicle based on the player's position and rotation:
      local x, y, z = getElementPosition ( sourcePlayer ) -- get the player's position
      local rotZ = getElementRotation ( sourcePlayer ) -- get the player's rotation around the Z axis in degrees
      x = x + ( ( math.cos ( math.rad ( rotZ ) ) ) * distance ) -- calculate the X position of the vehicle
      y = y + ( ( math.sin ( math.rad ( rotZ ) ) ) * distance ) -- calculate the Y position of the vehicle

      -- get the complete vehicle name by joining all passed parameters using Lua function table.concat
      local vehicleName = table.concat({...}, " ")
      -- get the vehicle's model ID from the name
      local vehicleID = getVehicleModelFromName ( vehicleName )
      -- if vehicle ID is valid,
      if vehicleID then
            -- create the vehicle using the information gathered above:
            local newVehicle = createVehicle ( vehicleID, x, y, z, 0, 0, rotZ )
            -- if vehicle creation failed, give the player a message
            if not newVehicle then
               outputConsole ( "Failed to create vehicle.", sourcePlayer )
            end
      end
   end
end

-- Attach the 'consoleCreateVehicle' function to the "createvehicle" command
addCommandHandler ( "createvehicle", consoleCreateVehicle )