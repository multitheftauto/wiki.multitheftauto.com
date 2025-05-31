function onClientPlayerWeaponFireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
    if (weapon == 25) then -- If the player shoots with a shotgun
        createExplosion(hitX, hitY, hitZ, 12, true, 0, true) -- Creates a tiny explosion where the bullet hit.
    end
end
-- Add this as a handler so that the function will be triggered every time a player fires.
addEventHandler("onClientPlayerWeaponFire", root, onClientPlayerWeaponFireFunc)