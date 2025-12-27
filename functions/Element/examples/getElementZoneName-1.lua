function playerloc(source)
    local playername = getPlayerName(source)
    local location = getElementZoneName(source)
    outputChatBox("* " .. playername .. "'s Location: " .. location, getRootElement(), 0, 255, 255) -- Output the player's name and zone name
end
addCommandHandler("loc", playerloc)
