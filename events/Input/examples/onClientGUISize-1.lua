addEventHandler("onClientGUISize",guiRoot,function()
	outputChatBox("You have resized a "..getElementType(source)..".",255,255,0)
end)