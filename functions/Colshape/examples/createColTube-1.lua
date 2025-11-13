local theZone

function shapeHit(thePlayer)
    outputChatBox(getPlayerName(thePlayer).. " is in the zone!")
end

function setZone(playerSource, commandName, fX, fY, fZ, fRadius, fHeight)
    local fX, fY, fZ, fRadius, fHeight = tonumber(fX), tonumber(fY), tonumber(fZ), tonumber(fRadius), tonumber(fHeight)
    if (not fX) or (not fY) or (not fZ) or (not fRadius) or (not fHeight) then
        outputChatBox("Syntax: /"..commandName.." [X] [Y] [Z] [Radius] [Height]", playerSource)
    else
        if (theZone ~= nil) then
            destroyElement(theZone)
        end
        local tempCol = createColTube(fX, fY, fZ, fRaduis, fHeight)
        addEventHandler("onColShapeHit", tempCol, shapeHit)
        outputChatBox("Zone has "..(theZone ~= nil and "moved" or "created").."!", playerSource)
        theZone = tempCol
    end
end
addCommandHandler("set_zone", setZone, false, false)