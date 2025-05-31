function destroyVehicle (theVehicle, seat, jacker, forcedByScript)
   if seat == 0 then -- If ped was a driver
      if forcedByScript then
         destroyElement (theVehicle) -- If the exit was forced using removePedFromVehicle then destroy the vehicle
      elseif jacker then
         kickPlayer (jacker)
         destroyElement (theVehicle)
      end
   end
end

addEventHandler ("onPedVehicleExit", root, destroyVehicle)