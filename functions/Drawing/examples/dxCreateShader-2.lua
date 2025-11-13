local myShader_raw_data = [[
	texture tex;
	technique replace {
		pass P0 {
			Texture[0] = tex;
		}
	}
]]

addEventHandler("onClientResourceStart", resourceRoot, function()
	local myShader = dxCreateShader(myShader_raw_data) -- create shader from raw data
	if isElement(myShader) then
		local myTexture = dxCreateTexture("some_image.png") -- create texture from image file
		if isElement(myTexture) then
			-- apply image to world texture via shader
			dxSetShaderValue(myShader, "tex", myTexture)
			engineApplyShaderToWorldTexture(myShader, "shad_ped")
		else
			outputDebugString("Unable to load texture", 1)
		end
	else
		outputDebugString("Unable to create shader", 1)
	end
end)