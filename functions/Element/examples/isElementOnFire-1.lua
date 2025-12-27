function checkPlayerFire(thePlayer, cmd, name)
    local plr = thePlayer
    if (name) then
        plr = getPlayerFromName(name)
        if (not plr) then
            outputChatBox("Player not found.", thePlayer, 255, 0, 0)
            return
        end
    end

    if isElementOnFire(plr) then
        outputChatBox("So hot!", thePlayer, 255, 50, 0)
    else
        outputChatBox("You're cool. No flames detected.", thePlayer, 0, 255, 0)
    end
end
addCommandHandler("checkfire", checkPlayerFire)