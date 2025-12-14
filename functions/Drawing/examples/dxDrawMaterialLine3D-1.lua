local redcircle = dxCreateTexture("red.png")

local x,y,z = -2422.68555, -608.78986, 132.56250
local size = 1

addEventHandler("onClientRender", root, function()
    dxDrawMaterialLine3D(x+size, y+size, z-0.95, x-size, y-size, z-0.95, redcircle, size*2,tocolor(255, 255, 255, 255), 'postfx', x, y, z)
end)