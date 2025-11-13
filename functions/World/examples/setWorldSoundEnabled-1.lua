function toggleWeaponSounds_f ( )
    local enabled = isWorldSoundEnabled ( 5 ) -- We place this variable here for checking.
    enabled       = not enabled -- And here we invert (toggle) the variable, so if it's false, it becomes true, if it's true, it becomes false.
    -- Used for the chat declaration:
    local state   = "enabled"

    if ( not enabled ) then
        state = "disabled"
    end
    --

    setWorldSoundEnabled ( 5, enabled ) -- And here the toggling happens.
    outputChatBox ( "Weapon sounds " .. state )
end
addCommandHandler ( "toggleweaponsounds", toggleWeaponSounds_f )