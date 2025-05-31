local myNPC = createPed(187, 1481.265, -1752.25, 15.446, 0)

function antiKnife(targetPlayer)
    if targetPlayer == myNPC then
        cancelEvent()
    end
end
addEventHandler("onClientPlayerStealthKill", localPlayer, antiKnife)