addEventHandler("onClientVehicleCollision", root,
    function(collider, damageImpulseMag, bodyPart, x, y, z, nx, ny, nz)
         if ( source == getPedOccupiedVehicle(localPlayer) ) then
             -- force does not take into account the collision damage multiplier (this is what makes heavy vehicles take less damage than banshees for instance) so take that into account to get the damage dealt
             local fDamageMultiplier = getVehicleHandling(source).collisionDamageMultiplier
             -- Create a marker (Scaled down to 1% of the actual damage otherwise we will get huge markers)
             local m = createMarker(x, y, z, "corona", damageImpulseMag* fDamageMultiplier * 0.01, 0, 9, 231)
             -- Destroy the marker in 2 seconds
             setTimer(destroyElement, 2000, 1, m)
         end
    end
)