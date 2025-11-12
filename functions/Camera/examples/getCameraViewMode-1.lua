function onPlayerSpawn(theSpawnpoint)
    currentCam("fire") -- start a repeating check
end
addEventHandler("onClientPlayerSpawn", root, onPlayerSpawn)

function currentCam(key)
   if (getControlState(key)) then
      local vehicleMode, pedMode = getCameraViewMode()
      outputChatBox("Your current cam view is: " .. vehicleMode .. ".")
   end
end