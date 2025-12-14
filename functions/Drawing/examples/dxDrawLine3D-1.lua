local testVehicle

function createLine()
    if (not testVehicle) then
        return
    end

    local x1, y1, z1 = getElementPosition(testVehicle) -- Get test vehicles position.
    local x2, y2, z2 = getElementPosition(localPlayer) -- Get local players position.
    dxDrawLine3D(x1, y1, z1, x2, y2, z2, tocolor(0, 255, 0, 230), 2) -- Create 3D Line between test vehicle and local player.
end

function makeLineAppear()
    testVehicle = createVehicle(411, 0, 0, 5) -- Create our test vehicle.
    addEventHandler("onClientRender", root, createLine) -- onClientRender keeps the 3D Line visible.
end
addCommandHandler("line", makeLineAppear)
