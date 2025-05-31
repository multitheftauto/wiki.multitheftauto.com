function consoleCheck(text)
	outputChatBox("You entered into the console: "..text, 255, 255, 0)
end
addEventHandler("onClientConsole", localPlayer, consoleCheck)