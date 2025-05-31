local projectileNames = {
    [16]='Grenade',
    [17]='Tear Gas Grenade',
    [18]='Molotov',
    [19]='Rocket (simple)',
    [20]='Rocket (heat seeking)',
    [21]='Air Bomb',
    [39]='Satchel Charge',
    [58]='Hydra flare'
}

addEventHandler('onPlayerProjectileCreation', root,
    function(weaponType)
        cancelEvent()
        
        local weaponName = projectileNames[weaponType] or 'Unknown'
        outputServerLog('* '..getPlayerName(source)..' created projectile ('..weaponName..')! most likely he is cheater, event canceled')
    end
)