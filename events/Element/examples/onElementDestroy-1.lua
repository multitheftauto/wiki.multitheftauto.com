addEventHandler("onElementDestroy", getRootElement(), function ()
  if getElementType(source) == "vehicle" then
    local nPassengers = getVehicleMaxPassengers(source)
    for i=0,nPassengers-1 do
      local occupant = getVehicleOccupant(source, i)
      if occupant then
        outputChatBox("The vehicle that you were in has been destroyed by the script", occupant)
      end
    end
  end
end)