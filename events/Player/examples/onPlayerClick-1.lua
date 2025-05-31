function outputClick(mouseButton, buttonState)
	outputChatBox("Your "..mouseButton.." mouse button is now "..buttonState,source,255,255,0) -- output the state of the button they just pressed.
end
addEventHandler("onPlayerClick", root, outputClick) -- When a player clicks trigger the outputClick function