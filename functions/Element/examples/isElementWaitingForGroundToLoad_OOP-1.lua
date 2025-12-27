local function notifyFarRespawnOnMap()
    if source.waitingForGroundToLoad then
        outputChatBox("* A " .. source.name .. " respawned above an object which is far away! Find it quick!", 128, 255, 0)
    end
end
addEventHandler("onClientVehicleRespawn", root, notifyFarRespawnOnMap)