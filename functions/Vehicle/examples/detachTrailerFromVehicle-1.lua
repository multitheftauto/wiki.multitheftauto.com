-- the handler function for the "unhook" console command
function unhookTrailer(playerSource, commandName)
   -- check if a player triggered this command and that they are in a vehicle
   if (playerSource and isPedInVehicle(playerSource)) then
      local theVehicle = getPedOccupiedVehicle(playerSource) -- get the vehicle the player is in
      local success = detachTrailerFromVehicle(theVehicle) -- attempt to detach a trailer from this vehicle
      -- report whether the operation waa a success
      if (success) then
         outputConsole("Trailer detached!", playerSource)
      else
         outputConsole("Failed to detach trailer.", playerSource)
      end
   end
end

-- make the function above handle the "unhook" command
addCommandHandler("unhook", unhookTrailer)