local function clientPlayerPickupHit(thePickup, matchingDimension)
    outputChatBox("* You have hit a pickup!", 255, 0, 0)
end
addEventHandler("onClientPlayerPickupHit", localPlayer, clientPlayerPickupHit)