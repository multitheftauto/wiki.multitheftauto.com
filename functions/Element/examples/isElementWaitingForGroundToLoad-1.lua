local function notifyFarRespawnOnMap()
    if isElementWaitingForGroundToLoad(source) then
        outputChatBox("* A " .. getVehicleName(source) .. " respawned above an object which is far away! Find it quick!", 128, 255, 0)
    end
end
addEventHandler("onClientVehicleRespawn", root, notifyFarRespawnOnMap)