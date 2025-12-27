function showPlayer(command, index)
    local thePlayer = getElementByIndex("player", tonumber(index))
    if thePlayer then
        outputChatBox("Player " .. index .. " is a: " ..getPlayerName(thePlayer))
    else
        outputChatBox("Player not found.")
    end
end
addCommandHandler("player", showPlayer)
