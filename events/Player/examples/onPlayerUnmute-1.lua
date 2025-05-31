function unmuted()
    outputChatBox(getPlayerName(source) .. " has been unmuted", root, 255, 0, 0)
end
addEventHandler("onPlayerUnmute", root, unmuted)