local theZone

local function shapeHit(hitElement, matchingDimensions)
    if (hitElement and hitElement.type == 'player' and matchingDimensions) then
        outputChatBox(thePlayer.name.. " is in the zone!")
    end
end

function setZone(playerSource, commandName, fX, fY, fWidth, fDepth)
    local fX, fY, fWidth, fDepth = tonumber(fX), tonumber(fY), tonumber(fWidth), tonumber(fDepth)
    if (not fX) or (not fY) or (not fWidth) or (not fDepth) then
        playerSource:outputChatBox("Syntax: /"..commandName.." [X] [Y] [Width] [Depth]")
    else
        if (theZone) then
            theZone:destroy()
        end
        local tempCol = ColShape.Rectangle(fX, fY, fWidth, fDepth)
        addEventHandler("onColShapeHit", tempCol, shapeHit)
        playerSource:outputChat("Zone has "..(theZone ~= nil and "moved" or "created").."!")
        theZone = tempCol
    end
end
addCommandHandler("set_zone", setZone, false, false)