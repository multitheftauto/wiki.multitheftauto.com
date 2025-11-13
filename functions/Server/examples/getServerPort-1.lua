function outputServerPort ( )
        local serverPort = getServerPort() 
	outputChatBox (" Server Port: "..serverPort.." ") --Output Serverport in Chatbox
end
addCommandHandler ( "serverport", outputServerPort )  --add the command Handler