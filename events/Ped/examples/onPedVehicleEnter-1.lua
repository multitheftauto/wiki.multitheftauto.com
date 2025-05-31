function sendMessage (theVehicle, seat)
   local vehicleName = getVehicleName (theVehicle) -- Get name of the vehicle
   if seat == 0 then -- if the ped is a driver
      outputChatBox ("Ped is now a driver of "..vehicleName, root)
   else -- if not
      outputChatBox ("Ped has entered to "..vehicleName, root)
   end
end

addEventHandler ("onPedVehicleEnter", root, sendMessage)