function noDamageToPlayersFromCustomWeapons(target)
    if target == localPlayer then
        cancelEvent() -- If the weapon hit the player, cancel the shot
    end
end
addEventHandler("onClientWeaponFire", root, noDamageToPlayersFromCustomWeapons)