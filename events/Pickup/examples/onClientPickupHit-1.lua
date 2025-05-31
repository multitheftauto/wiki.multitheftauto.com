local function clientPickupHit(thePlayer, matchingDimension)
    outputChatBox("* "..getPlayerName(thePlayer).." hit a pickup!", 255, 0, 0)
end
addEventHandler("onClientPickupHit", root, clientPickupHit)