function onColShapeHit ( thePlayer, matchingDimension )
    -- When a player hits the collision shape, give him a spin
    setElementAngularVelocity ( thePlayer, 0, 0, 20 )
end
addEventHandler ( "onColShapeHit", root, onColShapeHit )