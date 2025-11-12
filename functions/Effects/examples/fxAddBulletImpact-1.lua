addEventHandler("onClientPlayerWeaponFire", root, function(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
    if weapon == 0 then return end -- If the player is unarmed, return end.
    fxAddBulletImpact(hitX, hitY, hitZ, 0, 0, 0, math.random(1, 2), math.random(2, 5), 1.0)
end)