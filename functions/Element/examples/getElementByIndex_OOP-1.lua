function showPlayer(command, index)
    local thePlayer = Element.getByIndex("player", tonumber(index))
    if thePlayer then
        outputChatBox("Player " .. index .. " is a: " ..thePlayer.name)
    else
        outputChatBox("Player not found.")
    end
end
addCommandHandler("player", showPlayer)
