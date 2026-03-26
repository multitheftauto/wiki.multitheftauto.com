function onClientResourceStartSetGUIInputMode()
	GuiElement.inputMode = "no_binds_when_editing"
end
addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStartSetGUIInputMode)