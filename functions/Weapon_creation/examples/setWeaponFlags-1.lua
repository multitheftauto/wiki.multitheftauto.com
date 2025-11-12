local function setupDeadlyWeapon()
    local weapon = createWeapon("minigun", 0, 0, 10) -- Create the minigun
    setWeaponTarget(weapon, localPlayer) -- Set the weapon target to the local player
    setWeaponFlags(weapon, "flags", false, false, false, false, false, false, false, false) -- Allow the weapon to shoot through everything
end
addEventHandler("onClientResourceStart", resourceRoot, setupDeadlyWeapon)