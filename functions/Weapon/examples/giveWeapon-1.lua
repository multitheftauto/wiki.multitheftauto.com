function giveWeaponsOnSpawn ( theSpawnpont, theTeam )
    giveWeapon ( source, 31, 200 ) -- Gives the M4 weapon with 200 ammo
end
addEventHandler ( "onPlayerSpawn", root, giveWeaponsOnSpawn ) -- attach the event handler