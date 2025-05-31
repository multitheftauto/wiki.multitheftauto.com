function onStealthKill(targetPlayer)
     outputChatBox("Stealth kill!", source) -- Tell the player he/she has done a stealth kill.
     outputChatBox(getPlayerName(targetPlayer).." has been stealth-killed by "..getPlayerName(source)..".")
end
addEventHandler("onPlayerStealthKill", root, onStealthKill) -- Adds a handler for the stealth kill event.