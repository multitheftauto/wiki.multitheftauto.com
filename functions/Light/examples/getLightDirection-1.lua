function lightDirection ()
	local light = createLight(0, 1, 0, 4)
	local lx, ly, lz = getLightDirection(light)
	outputChatBox("light direction: " .. lx .. ", " .. ly .. ", " .. lz)
end
addCommandHandler("lightDirection", lightDirection)