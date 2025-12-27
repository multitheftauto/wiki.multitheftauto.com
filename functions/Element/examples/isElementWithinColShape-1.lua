local circlearea = createColCircle(0, 0, 10)

function ColShapeHit(thePlayer, matchingDimension)
    local detection = isElementWithinColShape(thePlayer, circlearea)
    -- A variable called 'detection' stores the result of asking if the player
    -- who entered a colshape is within the specific colshape called 'circlearea'.
    -- The result is either true or false.
    detection = detection and getElementDimension(thePlayer) == getElementDimension(circlearea)
    -- Let's additionally check element dimensions.
    if detection then
        outputChatBox(getPlayerName(thePlayer) .. " is in the 'circle area' col shape")
    end
    -- if detection was true then the player is in the col shape. Output a
    -- message to confirm this
end
addEventHandler("onColShapeHit", root, ColShapeHit)
