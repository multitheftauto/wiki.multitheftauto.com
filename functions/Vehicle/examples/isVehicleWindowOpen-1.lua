function openVehicleWindow (cmd,number)
   if (isPedInVehicle (localPlayer)) then
      local vehicle = getPedOccupiedVehicle(localPlayer) 
      if number and tonumber(number) then
	 if tonumber(number) > 0 and tonumber(number) < 7 then
	    setVehicleWindowOpen(vehicle,tonumber(number), not isVehicleWindowOpen( vehicle, tonumber(number)))
	 end
      end
   end
end
addCommandHandler ("openwindow",openVehicleWindow)