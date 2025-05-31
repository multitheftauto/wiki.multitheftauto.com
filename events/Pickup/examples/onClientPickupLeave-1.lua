local function clientPickupLeave(thePlayer, matchingDimension)
    outputChatBox("* "..getPlayerName(thePlayer).." left a pickup!", 255, 0, 0)
end
addEventHandler("onClientPickupLeave", root, clientPickupLeave)