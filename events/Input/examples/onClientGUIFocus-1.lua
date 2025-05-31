local window, editbox = nil, nil
addCommandHandler("example",
function()
	local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 263, 90
	local left = screenWidth/2 - windowWidth/2
	local top = screenHeight/2 - windowHeight/2
	window = guiCreateWindow(left, top, windowWidth, windowHeight, "Example Window", false)		
	editbox = guiCreateEdit(11, 41, 241, 22, "", false, window)
	addEventHandler("onClientGUIFocus", editbox, onClientGUIFocus_editbox, true) --true because for the example we want propagated events
	addEventHandler("onClientGUIBlur", editbox, onClientGUIBlur_editbox, true) --true because for the example we want propagated events
	showCursor(true)
end)

function onClientGUIFocus_editbox()
	if source == editbox then
		outputChatBox("Example editBox received input focus")
	elseif source == window then
		outputChatBox("Example window received input focus")
	end
end

function onClientGUIBlur_editbox()
	if source == editbox then
		outputChatBox("Example editBox lost input focus")
	elseif source == window then
		outputChatBox("Example window lost input focus")
	end
end