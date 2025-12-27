addCommandHandler('moveme', function()
    if (localPlayer.vehicle) then
        localPlayer.vehicle.velocity = Vector3(1, 1, 5)
    end
end)