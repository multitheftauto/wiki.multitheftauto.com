local enabled = false
 
addCommandHandler("ccam", function()
    enabled = not enabled
    if enabled then
        start = getTickCount()
        dx, dy, dz, lx, ly, lz = getCameraMatrix()
        addEventHandler("onClientPreRender", root, interpolateCam)
    else
        start = nil
        setCameraTarget(localPlayer)
        removeEventHandler("onClientPreRender", root, interpolateCam)
    end
end)
 
function interpolateCam()
    local now = getTickCount()
    local endTime = start + 2000
    local elapsedTime = now - start
    local duration = endTime - start
    local progress = elapsedTime / duration
    local px, py, pz = getElementPosition(localPlayer)
    local x, y, z = interpolateBetween ( dx, dy, dz, dx+4, dy+4, dz, progress, "OutQuad")
    setCameraMatrix(x, y, z, px, py, pz+0.6, 0, 0)
end