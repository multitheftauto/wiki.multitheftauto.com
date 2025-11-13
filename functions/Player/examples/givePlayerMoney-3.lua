local money = createPickup (1896.4000244141, -1950.9000244141, 13, 3, 1274, 10000 )
function pickupUse ( player )
    givePlayerMoney ( player, 30000 )
end
addEventHandler ( "onPickupUse", money, pickupUse )