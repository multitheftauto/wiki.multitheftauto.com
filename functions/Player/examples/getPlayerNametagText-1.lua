function showNametag ( thePlayer, command )
	local nameTag = getPlayerNametagText ( thePlayer )
	outputChatBox ( "Your nametag text is: " .. nameTag, thePlayer )
end
addCommandHandler("myNametag", showNametag)