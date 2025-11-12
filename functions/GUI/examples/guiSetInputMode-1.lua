function onClientResourceStartSetGUIInputMode()
	guiSetInputMode("no_binds_when_editing") -- Calls guiSetInputMode once and for all to not have to handle binds state dynamically
end
addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStartSetGUIInputMode)