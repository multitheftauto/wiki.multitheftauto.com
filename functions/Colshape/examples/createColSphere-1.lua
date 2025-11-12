local theZone

function shapeHit(thePlayer)
    outputChatBox(getPlayerName(thePlayer).. " is in the zone!")
end

function setZone(playerSource, commandName, fX, fY, fZ, fRadius)
    local fX, fY, fZ, fRadius = tonumber(fX), tonumber(fY), tonumber(fZ), tonumber(fRadius)
    if (not fX) or (not fY) or (not fZ) or (not fRadius) then
        outputChatBox("Syntax: /"..commandName.." [X] [Y] [Z] [Radius]", playerSource)
    else
        if (theZone ~= nil) then
            destroyElement(theZone)
        end
        local tempCol = createColSphere(fX, fY, fZ, fRadius)
        addEventHandler("onColShapeHit", tempCol, shapeHit)
        outputChatBox("Zone has "..(theZone ~= nil and "moved" or "created").."!", playerSource)
        theZone = tempCol
    end
end
addCommandHandler("set_zone", setZone, false, false)