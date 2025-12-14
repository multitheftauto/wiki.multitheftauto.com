function drawCircle(x, y, radius, color)
    local numPoints = math.floor(math.pow(radius, 0.4) * 5) -- Calculate number of points to make it look good
    local step = math.pi * 2 / numPoints
    local sx, sy
    for p = 0, numPoints do
        local ex = math.cos(p * step) * radius
        local ey = math.sin(p * step) * radius
        if sx then
            dxDrawLine(x + sx, y + sy, x + ex, y + ey, color)
        end
        sx, sy = ex, ey
    end
end

addEventHandler("onClientRender", root, function()
    drawCircle(350, 350, 10, tocolor(255, 0, 255))
    drawCircle(350, 350, 50, tocolor(255, 0, 255))
end)
