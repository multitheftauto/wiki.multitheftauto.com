local theZone

function shapeHit(thePlayer)
    outputChatBox(getPlayerName(thePlayer).. " is in the zone!")
end

function setZone(playerSource, commandName, fX, fY, fRadius)
    local fX, fY, fRadius = tonumber(fX), tonumber(fY), tonumber(fRadius)
    if (not fX) or (not fY) or (not fRadius) then
        outputChatBox("Syntax: /"..commandName.." [X] [Y] [Radius]", playerSource)
    else
        if (theZone ~= nil) then
            destroyElement(theZone)
        end
        local tempCol = createColCircle(fX, fY, fRadius)
        addEventHandler("onColShapeHit", tempCol, shapeHit)
        outputChatBox("Zone has "..(theZone ~= nil and "moved" or "created").."!", playerSource)
        theZone = tempCol
    end
end
addCommandHandler("set_zone", setZone, false, false)