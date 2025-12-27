function waterCheck(thePlayer)
    if isElementInWater(thePlayer) then
        outputChatBox("Wet.", thePlayer)
    else
        outputChatBox("Dry.", thePlayer)
    end
end
addCommandHandler("check", waterCheck)
