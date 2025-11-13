function commandRefreshResources(player)
    refreshResources(true)
    outputChatBox("Resources refreshed", player, 255, 255, 0)
end
addCommandHandler("refreshresources", commandRefreshResources)