local hi = guiCreateRadioButton(243, 204, 36, 16, "Hi", false)
guiRadioButtonSetSelected(hi, true)

local bye = guiCreateRadioButton(243, 224, 41, 16, "Bye", false)

addEventHandler('onClientGUIClick', resourceRoot, function()
	if (guiRadioButtonGetSelected(hi)) then
		outputChatBox("Hi " .. getPlayerName(localPlayer))
		guiRadioButtonSetSelected(bye, true)
	else
		outputChatBox("Bye " .. getPlayerName(localPlayer))
		guiRadioButtonSetSelected(hi, true)
	end
end)