function outputLicensePlate ( command )
    if isPedInVehicle(localPlayer) then --let's check if they're in a vehicle
         -- if they are in a vehicle
         local vehicle = getPedOccupiedVehicle ( localPlayer ) --let's get the vehicle
         local plateText = getVehiclePlateText ( vehicle ) --get the license plate text
         if plateText then -- if there was a license plate,
             outputChatBox ( "Your license plate is: " .. plateText )-- output it to the chatbox
         else
             outputChatBox ( "Your vehicle has no license plate." )
         end
    else
         outputChatBox ( "You're not in a vehicle." )
    end
end
-- add our function as a handler to the "plate" command
addCommandHandler( "plate", outputLicensePlate )