function AmIOutside(thePlayer, command)
    if (getElementInterior(thePlayer) == 0) then
        outputChatBox("Yes you are outside " .. getPlayerName(thePlayer), thePlayer)
    else
        outputChatBox("No you aren't outside " .. getPlayerName(thePlayer), thePlayer)
    end
end
addCommandHandler("AmIOutside", AmIOutside)
