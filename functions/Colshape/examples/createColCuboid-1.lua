local theZone

local function shapeHit(hitElement, matchingDimensions)
    if (hitElement and getElementType(hitElement) == 'player' and matchingDimensions) then
        outputChatBox(getPlayerName(thePlayer).. " is in the zone!")
    end
end

function setZone(playerSource, commandName, fX, fY, fZ, fWidth, fDepth, fHeight)
    local fX, fY, fZ, fWidth, fDepth, fHeight = tonumber(fX), tonumber(fY), tonumber(fZ), tonumber(fWidth), tonumber(fDepth), tonumber(fHeight)
    if (not fX) or (not fY) or (not fZ) or (not fWidth) or (not fDepth) or (not fHeight) then
        outputChatBox("Syntax: /"..commandName.." [X] [Y] [Z] [Width] [Depth] [Height]", playerSource)
    else
        if (theZone) then
            destroyElement(theZone)
        end
        local tempCol = createColCuboid(fX, fY, fZ, fWidth, fDepth, fHeight)
        addEventHandler("onColShapeHit", tempCol, shapeHit)
        outputChatBox("Zone has "..(theZone ~= nil and "moved" or "created").."!", playerSource)
        theZone = tempCol
    end
end
addCommandHandler("set_zone", setZone, false, false)