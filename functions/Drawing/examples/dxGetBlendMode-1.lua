-- Function to draw a rectangle with the current blend mode displayed
function renderBlendModeExample()
    -- Get the current blend mode
    local blendMode = dxGetBlendMode()
    
    -- Draw a background rectangle
    dxDrawRectangle(100, 100, 300, 200, tocolor(0, 0, 255, 100))

    -- Draw some text on top of the rectangle
    dxDrawText("Current Blend Mode: " .. blendMode, 110, 110, 390, 190, tocolor(255, 255, 255, 255), 1.5, "default-bold")
end

-- Add an event handler to render the rectangle and text every frame
addEventHandler("onClientRender", root, renderBlendModeExample)