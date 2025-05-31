function Spawn()
    giveWeapon(source, 31, 500, true) -- Gives the weapon Ak-47, with 500 ammo and on the hand
end
addEventHandler("onPlayerSpawn", root, Spawn) -- This will exec every time a Player spawn