function getSurfaceVehicleIsOn(vehicle)
    if isElement(vehicle) and (isVehicleOnGround(vehicle) or isElementInWater(vehicle)) then -- Is an element and is touching any surface?
        local cx, cy, cz = getElementPosition(vehicle) -- Get the position of the vehicle
        local gz = getGroundPosition(cx, cy, cz) - 0.001 -- Get the Z position of the ground the vehicle is on (-0.001 because of processLineOfSight)
        local hit, _, _, _, _, _, _, _, surface = processLineOfSight(cx, cy, cz, cx, cy, gz) -- This will get the material of the thing the car is standing on
        if hit then
            return surface -- If everything is correct, stop executing this function and return the surface type
        end
    end
    return false -- If something isn't correct, return false
end