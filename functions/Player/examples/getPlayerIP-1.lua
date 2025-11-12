function printIp ( thePlayer )
	outputChatBox ( "IP: " .. getPlayerIP ( thePlayer ), thePlayer )
end
addCommandHandler ( "ip", printIp )