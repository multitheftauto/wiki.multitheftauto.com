function clientPlayerPickupLeave(thePickup, matchingDimension)
    outputChatBox("* You have left a pickup!", 255, 0, 0)
end
addEventHandler("onClientPlayerPickupLeave", localPlayer, clientPlayerPickupLeave)