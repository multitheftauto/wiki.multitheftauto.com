function announceBan( theBan )
   if ( isElement( source ) ) and ( getElementType( source ) == "player" ) then -- Check if the element responsible for the ban is a player element
	outputChatBox( getPlayerName( source ) .. " banned " .. ( getBanSerial( theBan ) or getBanIP( theBan ) ) ) -- Output to the chatbox saying the player has banned the IP/Serial
   end
end
addEventHandler( "onBan", root, announceBan ) -- Adds the event handler for "onBan" and must be bound to root