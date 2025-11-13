function projectileCreation()
	local theType = getProjectileType(source)
	outputChatBox("A projectile was created! It's type: "..theType)
end
addEventHandler("onClientProjectileCreation", getRootElement(), projectileCreation)