local theZone

local function shapeHit(hitElement, matchingDimensions)
    if (hitElement and element.type == 'player' and matchingDimensions) then
        outputChatBox(thePlayer.name.. " is in the zone!")
    end
end

function setZone(playerSource, commandName, fX, fY, fZ, fRadius)
    local fX, fY, fZ, fRadius = tonumber(fX), tonumber(fY), tonumber(fZ), tonumber(fRadius)
    if (not fX) or (not fY) or (not fZ) or (not fRadius) then
        playerSource:outputChat("Syntax: /"..commandName.." [X] [Y] [Z] [Radius]")
    else
        if (theZone) then
            theZone:destroy()
        end
        local tempCol = ColShape.Sphere(fX, fY, fZ, fRadius)
        addEventHandler("onColShapeHit", tempCol, shapeHit)
        playerSource:outputChat("Zone has "..(theZone ~= nil and "moved" or "created").."!")
        theZone = tempCol
    end
end
addCommandHandler("set_zone", setZone, false, false)