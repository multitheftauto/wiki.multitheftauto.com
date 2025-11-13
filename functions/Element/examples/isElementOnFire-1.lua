function checkPlayerFire(thePlayer)
    if isElementOnFire(thePlayer) then
        outputChatBox("So hot!", thePlayer, 255, 50, 0)
    else
        outputChatBox("You're cool. No flames detected.", thePlayer, 0, 255, 0)
    end
end
addCommandHandler("checkfire", checkPlayerFire)