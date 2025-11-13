local dutymarker = createMarker(126.56, 254.98, 78.9, "cylinder", 2.0, 255, 0, 0, 150)

function duty(thePlayer)
    if isElementWithinMarker(thePlayer, dutymarker) then
        giveWeapon(thePlayer, 22, 100, 1)  
    else
        outputChatBox("You are not at the right place!", thePlayer, 255, 0, 0)
    end
end
addCommandHandler("duty", duty)