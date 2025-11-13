function onPickupHitFunc ( thePlayer )                  -- when a pickup is hit
    if getPickupType ( source ) == 2 then               -- check if it's a weapon pickup
        local ammo = getPickupAmmo ( source )           -- get the pickup ammo
        if ammo < 50 then                               -- if ammo is less than 50
            local weapon = getPickupWeapon ( source )   -- store pickup weapon
            giveWeaponAmmo ( thePlayer, weapon, 50 )    -- give an extra 50 ammo
        end
    end
end
addEventHandler ( "onPickupHit", root, onPickupHitFunc )    -- add the function as handler for onPickupHit