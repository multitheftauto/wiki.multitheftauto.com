-- *****************************************************************************
-- CLIENT CODE
function sendMessageToServer()
	local messageToSend = "Hello, world!" -- this string would be passed to server

	triggerServerEvent("onServerSendMessage", localPlayer, messageToSend) -- refer to the note on wiki page (under theElement), for understanding which element you should use as 2nd argument
end
addCommandHandler("message", sendMessageToServer)

-- *****************************************************************************
-- SERVER CODE
function onServerSendMessage(sentMessage)
	if (not client) then -- 'client' points to the player who triggered the event, and should be used as security measure (in order to prevent player faking)
		return false -- if this variable doesn't exists at the moment (for unknown reason, or it was the server who triggered this event), stop code execution
	end

	local matchingSource = (source == client) -- check whether source element (2nd argument in triggerServerEvent) passed from client was the exact same player

	if (not matchingSource) then -- apparently it wasn't
		return false -- so do not process this event
	end

	local dataType = type(sentMessage) -- check type of data coming from client
	local dataString = (dataType == "string") -- check whether it's string

	if (not dataString) then -- if it isn't string
		return false -- stop our code here
	end

	local minStringLength = 1 -- min allowed length of string
	local maxStringLength = 64 -- max allowed length of string
	local stringLength = utf8.len(sentMessage) -- get string length
	local allowedStringLength = (stringLength >= minStringLength and stringLength <= maxStringLength) -- verify whether length is allowed

	if (not allowedStringLength) then -- if string length was exceeded
		return false -- tell server to stop here
	end

	local playerName = getPlayerName(client) -- get name of player who sent message
	local chatMessage = playerName.." sent message from client: "..sentMessage

	outputChatBox(chatMessage, root, 255, 255, 255, false) -- output text sent from client-side for everyone on server

	-- useful utility for checking event data: https://wiki.multitheftauto.com/wiki/Script_security
end
addEvent("onServerSendMessage", true) -- 2nd argument should be set to true, in order to be triggered from counter side (in this case client-side)
addEventHandler("onServerSendMessage", root, onServerSendMessage)