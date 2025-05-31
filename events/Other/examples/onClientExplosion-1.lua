function onClientExplosion(x, y, z, theType)
	outputChatBox("Explosion created by a "..getElementType(source))
end
addEventHandler("onClientExplosion", root, onClientExplosion)