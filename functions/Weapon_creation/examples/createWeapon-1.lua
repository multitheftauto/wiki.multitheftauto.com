function createMinigunWeapon()
    -- Create the weapon 1 meter above the player
    local x, y, z = getElementPosition(localPlayer)
    local weapon = createWeapon("minigun", x, y, z + 1)
    -- Give it some ammo and fire it
    setWeaponClipAmmo(weapon, 99999)
    setWeaponState(weapon, "firing")

    -- Optionally adjust for model rotation (this value will be different for other weapons)
    setWeaponProperty(weapon, "fire_rotation", 0, -30, 0)
end
addCommandHandler("createminigun", createMinigunWeapon)