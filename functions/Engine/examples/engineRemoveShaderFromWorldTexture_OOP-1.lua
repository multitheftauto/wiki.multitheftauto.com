local theShader = DxShader("shader.fx")
local explosionTexture = DxTexture("tex/Explosion.png")

function replaceEffect()
    theShader:setValue("gTexture", explosionTexture)
    theShader:applyToWorldTexture("fireball6")
end
addEventHandler("onClientResourceStart", resourceRoot, replaceEffect)

addCommandHandler('resettexture', function()
    theShader:removeFromWorldTexture("fireball6")
end)