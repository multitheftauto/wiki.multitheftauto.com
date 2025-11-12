function setPlayerDebug (player)
    setPlayerScriptDebugLevel(player, 3)
    outputChatBox("You set debug script level to 3", player)
end 
addCommandHandler("setdebug", setPlayerDebug)