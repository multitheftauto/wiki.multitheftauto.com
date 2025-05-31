addEventHandler("onClientVehicleExplode", root, function()
  local modelname = getVehicleName(source)
  outputChatBox(modelname.." just exploded!")
end)