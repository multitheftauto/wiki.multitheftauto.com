-- we register quitPlayer as a handler for the event
addEventHandler("onPlayerQuit", root,
	function(quitType)
		outputChatBox(getPlayerName(source).." has left the server ("..quitType..")")
	end
)