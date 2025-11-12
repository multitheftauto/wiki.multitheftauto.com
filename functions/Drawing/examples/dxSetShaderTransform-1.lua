local shader
local texture
local angle = 0 -- Initialize angle for rotation
local radius = 50 -- Reduced radius for the circular motion
local centerX, centerY -- Center of the screen

function startShaderExample()
    -- Create a shader
    shader = dxCreateShader("texture.fx")
    
    -- Load a texture
    texture = dxCreateTexture("myTexture.png")
    
    -- Apply the texture to the shader
    dxSetShaderValue(shader, "gTexture", texture)
    
    -- Get the center of the screen
    local screenWidth, screenHeight = guiGetScreenSize()
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
    dxSetShaderTransform(shader, positionX, positionY, 0, 0, 0, angle)
    
    -- Draw a rectangle with the shader applied, following the circular path
    dxDrawImage(positionX - 128, positionY - 128, 256, 256, shader)
end

function stopShaderExample()
    if shader then
        destroyElement(shader)
        shader = nil
    end
    if texture then
        destroyElement(texture)
        texture = nil
    end
    removeEventHandler("onClientRender", root, renderShader)
end
addEventHandler("onClientResourceStop", resourceRoot, stopShaderExample)