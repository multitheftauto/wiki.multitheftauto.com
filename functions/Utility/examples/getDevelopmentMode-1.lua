addCommandHandler("dev",function()
	local boolean = not getDevelopmentMode() -- true/false
	setDevelopmentMode(boolean)
	outputChatBox("DevelopmentMode: "..tostring(boolean))
end)