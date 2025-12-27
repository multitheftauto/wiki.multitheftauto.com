local function drawTextOnWorldPosition(text, vecPosition)
    local x, y = getScreenFromWorldPosition(vecPosition)

    if x and y then
        dxDrawText(text, x, y, nil, nil, 0xFFFFFFFF, 2.0, "default-bold", "center", "center")
    end
end

addEventHandler('onClientRender', root, function()
    local vehicle = localPlayer.vehicle
    if (not vehicle) then
        return
    end

    local minX, minY, minZ, maxX, maxY, maxZ = vehicle:getBoundingBox()
    local vehicleMatrix = vehicle.matrix

    local a = vehicleMatrix:transformPosition(Vector3(minX, minY, maxZ))
    drawTextOnWorldPosition("a", a)
    local b = vehicleMatrix:transformPosition(Vector3(maxX, minY, maxZ))
    drawTextOnWorldPosition("b", b)
    local c = vehicleMatrix:transformPosition(Vector3(minX, maxY, maxZ))
    drawTextOnWorldPosition("c", c)
    local d = vehicleMatrix:transformPosition(Vector3(maxX, maxY, maxZ))
    drawTextOnWorldPosition("d", d)

    dxDrawLine3D(c, d, 0xFFFF0000, 1.0)
    dxDrawLine3D(a, b, 0xFFFF0000, 1.0)
    dxDrawLine3D(c, a, 0xFFFF0000, 1.0)
    dxDrawLine3D(d, b, 0xFFFF0000, 1.0)
    dxDrawLine3D(a, d, 0xFFFF0000, 1.0)
    dxDrawLine3D(b, c, 0xFFFF0000, 1.0)
end)