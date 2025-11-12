function toggleWeaponSounds_f ( )
    local enabled = not isWorldSoundEnabled (5)
    setWorldSoundEnabled ( 5, enabled ) -- And here the toggling happens.
    outputChatBox ( "Weapon sounds " .. (enabled and "enabled" or "disabled"))
end
addCommandHandler ( "toggleweaponsounds", toggleWeaponSounds_f )