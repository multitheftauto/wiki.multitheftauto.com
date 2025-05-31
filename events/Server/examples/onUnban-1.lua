root = getRootElement()

function announceUnban( theBan, responsibleElement )
	if getElementType( responsibleElement ) then --Check if a player unbanned the IP/Serial
		outputChatBox( getPlayerName( responsibleElement ) .. " unbanned " .. ( getBanSerial(theBan) or getBanIP(theBan) ) ) --Output to the chatbox saying the player has unbanned the IP/Serial
	end
end

addEventHandler( "onUnban", root, announceUnban ) --Adds the event handler for 'onUnban'