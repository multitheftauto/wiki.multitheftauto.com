local theZone

function shapeHit(thePlayer)
    outputChatBox(getPlayerName(thePlayer).. " is in the zone!")
end

function setZone(playerSource, commandName, fX, fY, fWidth, fHeight)
    local fX, fY, fWidth, fHeight = tonumber(fX), tonumber(fY), tonumber(fWidth), tonumber(fHeight)
    if (not fX) or (not fY) or (not fWidth) or (not fHeight) then
        outputChatBox("Syntax: /"..commandName.." [X] [Y] [Width] [Height]", playerSource)
    else
        if (theZone ~= nil) then
            destroyElement(theZone)
        end
        local tempCol = createColRectangle(fX, fY, fWidth, fHeight)
        addEventHandler("onColShapeHit", tempCol, shapeHit)
        outputChatBox("Zone has "..(theZone ~= nil and "moved" or "created").."!", playerSource)
        theZone = tempCol
    end
end
addCommandHandler("set_zone", setZone, false, false)