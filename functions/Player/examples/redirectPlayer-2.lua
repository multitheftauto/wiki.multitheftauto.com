function joinserverHandlerFunction (playerSource, commandName, serverIP, serverPort, serverPassword)
	if serverIP and serverPort then --if IP and Port were specified
		if serverPassword then --if also a password was specified
			redirectPlayer (playerSource, serverIP, tonumber(serverPort), serverPassword) --redirect the player
		else -- else if no password was specified
			redirectPlayer (playerSource, serverIP, tonumber(serverPort))  --redirect the player without using the serverPassword parameter
		end
	else -- if no IP or Port have been specified
		outputChatBox ("Error! Correct Syntax: /joinserver IP Port [Password]", playerSource) --output an Error message to the chatbox
	end
end

addCommandHandler ("joinserver", joinserverHandlerFunction)