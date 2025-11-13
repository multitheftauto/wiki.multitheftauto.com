addCommandHandler("getAdjust",function()
      if isPedInVehicle(localPlayer) then
           local adjusted = getVehicleAdjustableProperty(getPedOccupiedVehicle(localPlayer))
           if adjusted then
                outputChatBox(adjusted)
           else
                outputChatBox("Sorry, but your vehicle doesn't have any adjustable properties!")
           end
      else
           outputChatBox("Sorry, but you have to be in a vehicle to use this command!")
      end
end)