function reloadGun ( sourcePlayer, command )
    reloadPedWeapon ( sourcePlayer )
end
addCommandHandler ( "reloadgun", reloadGun )