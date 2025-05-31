function muted()
    outputChatBox(getPlayerName(source) .. " has been muted.", root, 255, 0, 0)
end
addEventHandler("onPlayerMute", root, muted)