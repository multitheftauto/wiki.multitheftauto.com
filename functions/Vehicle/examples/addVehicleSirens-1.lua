addEventHandler('onPlayerVehicleEnter', root, function(vehicle, seat)
   if (seat == 0) then
      addVehicleSirens(vehicle, 2, 2)
      setVehicleSirens(vehicle, 1, -0.3, 0, 0.8, 0, 0, 255, 255, 255)
      setVehicleSirens(vehicle, 2, 0.3, 0, 0.8, 255, 0, 0, 255, 255)
      -- You can also make the sirens flash immediately with 'setVehicleSirensOn(vehicle, true)'
   end
end)

addEventHandler('onPlayerVehicleExit', root, function(vehicle, seat)
   removeVehicleSirens(vehicle)
end)