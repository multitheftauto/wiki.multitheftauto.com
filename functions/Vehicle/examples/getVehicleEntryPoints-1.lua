addEventHandler("onClientRender", root, function()
    for _, vehicle in pairs(getElementsByType("vehicle", root, true)) do
        local entryX, entryY, entryZ = getElementPosition(vehicle) 
        for index, position in pairs(getVehicleEntryPoints(vehicle)) do
            local drawX, drawY, distance = getScreenFromWorldPosition(
                position[1], position[2], position[3], 100
            )

            if (drawX ~= false) then
                local cameraX, cameraY, cameraZ = getCameraMatrix()

                dxDrawCircle(drawX, drawY, 8 / (distance * 0.1), 0, 360, tocolor(255, 0, 0, 255))
                dxDrawText(tostring(index), drawX, drawY + ((8 / (distance * 0.1)) / 2) + ((2 / (distance * 0.1)) + 0.5), 0, 0, tocolor(255, 0, 0, 255),
                    3 / (distance * 0.1), "default-bold")
            end
        end
    end
end)