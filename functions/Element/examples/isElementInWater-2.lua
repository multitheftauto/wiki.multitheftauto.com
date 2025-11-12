function diedInWater()
   if isElementInWater(source) then
       local name = source == localPlayer and "You are" or getPlayerName(source).." is"
       outputChatBox(name.." sleeping with the fishies!")
   end
end
addEventHandler("onClientPlayerWasted", root, diedInWater)