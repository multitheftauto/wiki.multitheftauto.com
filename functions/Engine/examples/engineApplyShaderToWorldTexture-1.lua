theTechnique = dxCreateShader("shader.fx")
explosionTexture = dxCreateTexture( "tex/Explosion.png")

function replaceEffect()
	engineApplyShaderToWorldTexture(theTechnique, "fireball6")
	dxSetShaderValue (theTechnique, "gTexture", explosionTexture)
end
addEventHandler("onClientResourceStart", resourceRoot, replaceEffect)