local theWall = false

local function shapeHit(element)
    local descriptor = "undefined"

    if element.type == "player" then
        -- Use the player's name
        descriptor = element.name
    elseif element.type == "vehicle" then
        -- Use the vehicle's model name
        descriptor = element.name or descriptor
    end

    -- Output a message in the chat box for everyone on the server
    outputChatBox(descriptor .. " is in the zone!")
end

function createWallCommandHandler(playerSource, commandName, fromX, fromY, toX, toY)
    -- Verify the player has given us the minimum amount of bound points
    if not (fromX and fromY and toX and toY) then
        return playerSource:outputChat("Syntax: set_wall <fromX> <fromY> <toX> <toY>", 255, 100, 100)
    end

    -- Calculate the 90° angle for the line between the two coordinates from the arguments
    local radian90DegreeAngle = math.atan2(toY - fromY, toX - fromX) + math.pi / 2

    -- Depth/width of the wall
    local depth = 1

    -- Pre-calculate the cosinus/sinus distances
    local cosinusDepth = math.cos(radian90DegreeAngle) * depth / 2
    local sinusDepth = math.sin(radian90DegreeAngle) * depth / 2

    -- Calculate the points in the game world
    local x1, y1 = fromX - cosinusDepth, fromY - sinusDepth
    local x2, y2 = toX - cosinusDepth, toY - sinusDepth
    local x3, y3 = toX + cosinusDepth, toY + sinusDepth
    local x4, y4 = fromX + cosinusDepth, fromY + sinusDepth

    -- Create the collision shape with the calculated numbers
    local tempCol = ColShape.Polygon(fromX + (toX - fromX) / 2, fromY + (toY - fromY) / 2, x1, y1, x2, y2, x3, y3, x4, y4)

    if not tempCol then
        return playerSource:outputChat("Error: Couldn't create collision polygon", 255, 100, 100)
    end

    -- Destroy the previous collision polygon shape in case we already have one
    if isElement(theWall) then
        theWall:destroy()
    end

    -- Use a variable out-of-scope to keep track of the most recently created collision shape element
    theWall = tempCol

    -- Attach an event handler to the element to get notified whenever an element hits our collision shape
    addEventHandler("onColShapeHit", tempCol, shapeHit, false)

    playerSource:outputChat("Success: Collision shape has been created!", 100, 255, 100)
end
addCommandHandler("set_wall", createWallCommandHandler)
