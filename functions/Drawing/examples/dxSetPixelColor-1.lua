local texture

addEventHandler("onClientResourceStart", resourceRoot, function()
    texture = dxCreateTexture(64, 64)
    local pixels = dxGetTexturePixels(texture)
    for i = 0, 63 do
        for j = 0, 63 do
            dxSetPixelColor(pixels, j, i, math.random(255), math.random(255), math.random(255), 255)
        end
    end
    dxSetTexturePixels(texture, pixels)
end)

addEventHandler("onClientRender", root, function()
    dxDrawImage(300, 300, 64, 64, texture)
end)
