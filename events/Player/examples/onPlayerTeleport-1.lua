addEventHandler("onPlayerTeleport", root, function()
    outputServerLog("Player "..getPlayerName(source).." teleported unexpectedly. Possible hack detected.")
end)