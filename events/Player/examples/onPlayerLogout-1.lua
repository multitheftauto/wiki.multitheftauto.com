function loggedOut()
	outputChatBox( "You have successfully logged out!", source )
end
addEventHandler("onPlayerLogout",getRootElement(),loggedOut)