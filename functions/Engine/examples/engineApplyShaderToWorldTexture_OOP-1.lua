local shader = Shader("shader.fx")
local texture = Texture("water.png")

function replaceWater()
    shader:setValue("gTexture", texture)
    shader:applyToWorldTexture("waterclear256")
end
addEventHandler("onClientResourceStart", resourceRoot, replaceWater)
