function onVehicleRespawn ( exploded )
  -- Add this variable. It contains the vehicle name of the respawned vehicle
  local vehicleName = getVehicleName ( source )
  
  -- If it is exploded, echo a custom message
  if ( exploded == true ) then 
    outputChatBox("A " .. vehiclename .. " has been respawned, after an explosion")
  
  -- else echo a normal message
  else 
    outputChatBox("A " .. vehiclename .. " has been respawned")
  end
end

-- Add the Event Handler
addEventHandler ( "onVehicleRespawn", getRootElement(), onVehicleRespawn )