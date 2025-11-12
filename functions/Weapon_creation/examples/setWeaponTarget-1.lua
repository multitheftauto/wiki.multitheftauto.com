local function createWeaponFiringPedHead()
    -- Create the weapon and set a flag of it
    local weapon = createWeapon("uzi", 0, 0, 10)
    setWeaponFlags(weapon, "instant_reload", true)
    -- Set the weapon target to a ped and fire it forever
    setWeaponTarget(weapon, createPed(8, 0, 0, 5), 8)
    setWeaponState(weapon, "firing")
end
addEventHandler("onClientResourceStart", resourceRoot, createWeaponFiringPedHead)