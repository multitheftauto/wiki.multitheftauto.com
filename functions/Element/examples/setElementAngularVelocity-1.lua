function onColShapeHit(thePlayer, matchingDimension)
    local vehicle = getPedOccupiedVehicle(thePlayer)
    if (not vehicle) then return end

    setElementAngularVelocity(vehicle, 0, 0, 20)
end
addEventHandler("onColShapeHit", root, onColShapeHit)
