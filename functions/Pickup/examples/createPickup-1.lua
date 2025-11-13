function createDeathPickup ( totalammo, killer, killerweapon, bodypart ) --when a player dies
    x, y, z = getElementPosition ( source ) --get the position of the person who died and define it as x, y and z
    currentweapon = getPlayerWeapon ( source ) --get the current weapon of the dead person
    createPickup ( x, y, z, 2, currentweapon, 10000, totalammo )
end
addEventHandler ( "onPlayerWasted", root, createDeathPickup ) --add an event handler for onPlayerWasted