function remotePlayerJoin()
	outputChatBox("* " .. getPlayerName(source) .. " has joined the server")
end
addEventHandler("onClientPlayerJoin", root, remotePlayerJoin)