local primitive = {
    {2087.8, -1804.2, 13.5, tocolor(255, 0, 0)}, 
    {2087.7, -1810.5, 13.5, tocolor(0, 255, 0)}, 
    {2092.7, -1813.6, 17.7, tocolor(0, 0, 255)},
    {2097.5, -1806.8, 16, tocolor(255, 255, 255)}
}

function draw()
    dxDrawPrimitive3D("trianglefan", false, unpack(primitive))
end
addEventHandler("onClientRender", root, draw)