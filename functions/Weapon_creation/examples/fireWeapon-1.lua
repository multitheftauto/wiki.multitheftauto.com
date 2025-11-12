function createAndFire()
    local weaponElement = createWeapon("mp5", 0, 0, 3) -- Create a MP5 at the coordinates 0, 0, 3

    fireWeapon(weaponElement) -- Fire the weapon we spawned
end
addEventHandler("onClientResourceStart", resourceRoot, createAndFire)