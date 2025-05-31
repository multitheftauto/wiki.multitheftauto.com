myZone = createColSphere (2490, -1668, 12.5, 25) -- Creates a collision sphere.

function dimensionChecker (theElement, matchingDimension)
    if matchingDimension then -- Checks whether the entering element is in the same dimension as the collision shape.
        outputChatBox ("The element is in the same dimension.")
    else
        outputChatBox ("The element is not in the same dimension.")
    end
end
addEventHandler ("onClientColShapeHit", myZone, dimensionChecker)