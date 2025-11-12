function checkMap()
   local text = (isPlayerMapVisible() and "You are currently viewing your map!") or "Your map is not visible!"
   outputChatBox(text, 255, 255, 0) -- output text 
end
addCommandHandler("map", checkMap) -- add '/map' command to the check