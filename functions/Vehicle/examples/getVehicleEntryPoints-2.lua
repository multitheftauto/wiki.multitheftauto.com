addEventHandler("onClientVehicleStartEnter", root, function(thePlayer, seat, door)
    if thePlayer == localPlayer then
        local entryPoints = getVehicleEntryPoints(source)
        if entryPoints then
            local entryPoint = entryPoints[door + 1]
            if entryPoint then
                local distance = getDistanceBetweenPoints3D(Vector3(getElementPosition(localPlayer)), unpack(entryPoint))
                if distance > 2.5 then
                    outputChatBox("You are too far away from the door to enter this vehicle!")
                    cancelEvent()
                end
            end
        end
    end
end)