function createDeathPickup ( totalammo, killer, killerweapon, bodypart ) --when a player dies
    x, y, z = getElementPosition ( source ) --get the position of the person who died and define it as x, y and z
    local money=createPickup ( x, y, z, 3, 1212, 10000)
    local playermoney = getPlayerMoney(source) --get the amount of money the dead person has
    setElementData(money,"Amount",playermoney) --now let's set the value of the pickup
    takePlayerMoney(source,playermoney) --Let's take away all their money
end
addEventHandler ( "onPlayerWasted", root, createDeathPickup ) --add an event handler for onPlayerWasted