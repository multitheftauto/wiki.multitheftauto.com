local theShader = dxCreateShader("shader.fx")
local explosionTexture = dxCreateTexture("tex/Explosion.png")

function replaceEffect()
    dxSetShaderValue(theShader, "gTexture", explosionTexture)
    engineApplyShaderToWorldTexture(theShader, "fireball6")
end
addEventHandler("onClientResourceStart", resourceRoot, replaceEffect)

addCommandHandler('resettexture', function()
    engineRemoveShaderFromWorldTexture(theShader, "fireball6")
end)