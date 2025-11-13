local theZone = false

function shapeHit( element )
    local descriptor = "undefined"

    if getElementType( element ) == "player" then
        -- Use the player's name
        descriptor = getPlayerName( element )
    elseif getElementType( element ) == "vehicle" then
        -- Use the vehicle's model name
        descriptor = getVehicleName( element ) or descriptor
    end

    -- Output a message in the chat box for everyone on the server
    outputChatBox( descriptor .. " is in the zone!" )
end

function createZoneCommandHandler( playerSource, commandName, fX, fY, fX1, fY1, fX2, fY2, fX3, fY3, ... )
    -- Verify the player has given us the minimum amount of bound points
    if not ( fY and fX and fX1 and fY1 and fX2 and fX3 and fY3 ) then
        return outputChatBox( "Syntax: set_zone <X> <Y> <X1> <Y1> <X2> <Y2> <X3> <Y3> [<Xn> <Yn> ...]", playerSource, 255, 100, 100 )
    end

    -- Create the collision shape with the numbers from the arguments
    local tempCol = createColPolygon( fX, fY, fX1, fY1, fX2, fY2, fX3, fY3, ... )

    if not tempCol then
        return outputChatBox( "Error: Couldn't create collision polygon", playerSource, 255, 100, 100 )
    end

    -- Destroy the previous collision polygon shape in case we already have one
    if isElement( theZone ) then
        destroyElement( theZone )
    end

    -- Use a variable out-of-scope to keep track of the most recently created collision shape element
    theZone = tempCol

    -- Attach an event handler to the element to get notified whenever an element hits our collision shape
    addEventHandler( "onColShapeHit", tempCol, shapeHit, false )

    outputChatBox( "Success: Collision shape has been created!", playerSource, 100, 255, 100 )
end
addCommandHandler( "set_zone", createZoneCommandHandler )