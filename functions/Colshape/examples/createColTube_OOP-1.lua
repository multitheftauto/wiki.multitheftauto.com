local theZone

local function shapeHit(hitElement, matchingDimensions)
    if (hitElement and hitElement.type == 'player' and matchingDimensions) then
        outputChatBox(thePlayer.name.. " is in the zone!")
    end
end

function setZone(playerSource, commandName, fX, fY, fZ, fRadius, fHeight)
    local fX, fY, fZ, fRadius, fHeight = tonumber(fX), tonumber(fY), tonumber(fZ), tonumber(fRadius), tonumber(fHeight)
    if (not fX) or (not fY) or (not fZ) or (not fRadius) or (not fHeight) then
        playerSource:outputChat("Syntax: /"..commandName.." [X] [Y] [Z] [Radius] [Height]")
    else
        if (theZone) then
            theZone:destroy()
        end
        local tempCol = ColShape.Tube(fX, fY, fZ, fRaduis, fHeight)
        addEventHandler("onColShapeHit", tempCol, shapeHit)
        playerSource:outputChat("Zone has "..(theZone ~= nil and "moved" or "created").."!")
        theZone = tempCol
    end
end
addCommandHandler("set_zone", setZone, false, false)