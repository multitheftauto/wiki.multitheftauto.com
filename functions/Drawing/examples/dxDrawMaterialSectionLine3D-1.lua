coronaTexture = dxCreateTexture("corona.png")
red = tocolor(255,0,0)
green = tocolor(0,255,0)
blue = tocolor(0,0,255)

addEventHandler("onClientPreRender",root,
    function()
        local x,y,z = getElementPosition(localPlayer)

        dxSetBlendMode("add")   -- Add blend mode looks best for corona effects
        drawCorona( x+2, y+2, z+1, 1, red )
        drawCorona( x+1, y+3, z+2, 1, green )
        drawCorona( x-1, y+2, z+3, 1, blue )
        dxSetBlendMode("blend") -- Restore default
    end
)

-- Draw the corona texture
function drawCorona( x, y, z, size, color )
    dxDrawMaterialSectionLine3D ( x, y, z+size,
                                  x, y, z-size,
                                  0,0,1,1, coronaTexture, size, color)
end