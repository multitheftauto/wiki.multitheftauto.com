addEventHandler("onClientPlayerWeaponFire", root, function(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
    if weapon == 0 then return end -- If the player is unarmed, return end.
    local mX, mY, mZ = getPedWeaponMuzzlePosition(localPlayer)
    fxAddTankFire(mX, mY, mZ, 0, 90, 0)
end)