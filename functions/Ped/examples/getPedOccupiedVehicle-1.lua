function showVehicleName ( thePlayer )
   local theVehicle = getPedOccupiedVehicle ( thePlayer )
   if theVehicle then
      outputChatBox ( "Name of the Vehicle: " .. getVehicleName ( theVehicle ), thePlayer )
   else
      outputChatBox ( "You do not have a Vehicle!", thePlayer, 255, 0, 0, true )
   end
end
addCommandHandler ( "getcarname", showVehicleName )