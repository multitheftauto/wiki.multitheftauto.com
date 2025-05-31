addEventHandler("onPlayerDetonateSatchels", root, function()
    local msg = string.format("%s's Satchels has been detonated", getPlayerName(source))
    outputChatBox(msg)
end)