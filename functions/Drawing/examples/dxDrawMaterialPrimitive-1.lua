-- Load the texture
local texture = dxCreateTexture("myTexture.png")

-- Function to render a textured triangle
function renderPrimitive()
    if texture then
        -- Draw the primitive using the "trianglelist" type
        -- 3 vertices, each with 4 numbers: {x, y, u, v}
        dxDrawMaterialPrimitive("trianglelist", texture, false, {100, 100, 0, 0}, {300, 100, 1, 0}, {200, 300, 0.5, 1})
    end
end

-- Add an event handler to render the primitive every frame
addEventHandler("onClientRender", root, renderPrimitive)