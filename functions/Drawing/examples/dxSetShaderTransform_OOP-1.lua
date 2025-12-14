local shader
local texture
local angle = 0 -- Initialize angle for rotation
local radius = 50 -- Reduced radius for the circular motion
local centerX, centerY -- Center of the screen

function startShaderExample()
    -- Create a shader
    shader = DxShader("texture.fx")
    
    -- Load a texture
    texture = DxTexture("myTexture.png")
    
    -- Apply the texture to the shader
    shader:setValue("gTexture", texture)
    
    -- Get the center of the screen
    local screenWidth, screenHeight = GuiElement.getScreenSize()
    centerX = screenWidth / 2
    centerY = screenHeight / 2
    
    -- Start rendering the shader
    addEventHandler("onClientRender", root, renderShader)
end
addEventHandler("onClientResourceStart", resourceRoot, startShaderExample)

function renderShader()
    -- Increment the angle to create rotation over time
    angle = angle + 0.02
    if angle > 2 * math.pi then
        angle = 0
    end

    -- Calculate the position based on a smaller circular path
    local positionX = centerX + math.cos(angle) * radius
    local positionY = centerY + math.sin(angle) * radius

    -- Apply transformation: translation along a smaller circular path and rotation
    shader:setTransform(positionX, positionY, 0, 0, 0, angle)
    
    -- Draw a rectangle with the shader applied, following the circular path
    dxDrawImage(positionX - 128, positionY - 128, 256, 256, shader)
end

function stopShaderExample()
    if shader then
        shader:destroy()
        shader = nil
    end
    if texture then
        texture:destroy()
        texture = nil
    end
    removeEventHandler("onClientRender", root, renderShader)
end
addEventHandler("onClientResourceStop", resourceRoot, stopShaderExample)