addEventHandler("onVehicleEnter", getRootElement(), function(thePlayer, seat)
   if seat==0 then -- if the player is a driver
      addElementDataSubscriber(source, "id", thePlayer) -- subscribe the player to element
   end
end)