function sendMessageToServer()
	local messageToSend = "Hello, world!" -- this string would be passed to server

	triggerServerEvent("onServerSendMessage", localPlayer, messageToSend) -- refer to the note on wiki page (under theElement), for understanding which element you should use as 2nd argument
end
addCommandHandler("message", sendMessageToServer)