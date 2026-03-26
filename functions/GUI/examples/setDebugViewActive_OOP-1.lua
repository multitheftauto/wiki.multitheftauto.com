function enableDebug()
	GuiElement.setDebugViewActive(not GuiElement.isDebugViewActive())
end
addCommandHandler("debug", enableDebug)