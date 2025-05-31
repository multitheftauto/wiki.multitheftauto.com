--when a player connects
function playerConnect(playerNick, playerIP, playerUsername, playerSerial)
	if playerNick == "Player" then -- check if his nick is "Player"
		cancelEvent(true, 'The nick "Player" is not allowed, please change it to something else. You can change your nick in Settings menu Multiplayer tab.')
		return
	end
	-- output some data about the player
	outputChatBox(playerNick.." just connected to the server.")
	outputChatBox("IP: "..playerIP.." / Username: "..playerUsername.." / Serial: "..playerSerial)
end

--add the playerConnect function as a handler for onPlayerConnect
addEventHandler("onPlayerConnect", root, playerConnect)