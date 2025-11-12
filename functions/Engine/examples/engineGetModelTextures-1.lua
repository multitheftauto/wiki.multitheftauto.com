function init()
	textures = engineGetModelTextures(3722)
	addEventHandler("onClientRender", root, render)
end
addEventHandler("onClientResourceStart", resourceRoot, init)

function render()
	local offset = 0
	for name,texture in pairs(textures) do
		local size = dxGetPixelsSize(dxGetTexturePixels(texture))
		dxDrawImage(0+offset, 0, size, size, texture)
		offset = offset + size
	end
end