addEventHandler('onClientPedsProcessed', root, function()
    if (localPlayer.vehicle) then
        localPlayer.vehicle.lighting = 0
    end
end)