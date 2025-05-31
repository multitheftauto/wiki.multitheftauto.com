addEventHandler("onClientGUIMove",guiRoot,function()
	outputChatBox("You have moved :"..getElementType(source))
end)