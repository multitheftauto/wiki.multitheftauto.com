function showMap()
   if isPlayerMapVisible() then
      outputChatBox("Player-map closed", 0, 255, 0)
      forcePlayerMap(false)
   else
      outputChatBox("Viewing player-map", 0, 255, 0)
      forcePlayerMap(true)
   end
end
addCommandHandler("showmap", showMap)