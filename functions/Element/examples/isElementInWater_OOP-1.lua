function waterCheck(thePlayer)
    if thePlayer.inWater then
        thePlayer:outputChat("Wet.")
    else
        thePlayer:outputChat("Dry.")
    end
end
addCommandHandler("check", waterCheck)
