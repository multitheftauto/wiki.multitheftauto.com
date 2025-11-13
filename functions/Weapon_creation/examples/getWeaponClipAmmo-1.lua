local customWeapon

addEventHandler( "onClientResourceStart", resourceRoot,
    function()
        local x, y, z = getElementPosition(localPlayer) -- Get player position
        customWeapon = createWeapon("m4", x, y, z + 1) -- Create a M4
        setWeaponClipAmmo(customWeapon, 99999) -- Set the ammo in clip of the weapon to 99999, so it never should reload
        setWeaponState(customWeapon, "firing") -- Fire it permanently
        -- Add the 'getammoinclip' command to get the remaining ammo in clip of the weapon
        addCommandHandler("getammoinclip", getM4WeaponAmmo)
    end
)

function getM4WeaponAmmo()
    if customWeapon then
        -- Tell the player the remaining ammo in clip
        outputChatBox(getWeaponClipAmmo(customWeapon))
    else
        -- Weapon was not created, give an error
        outputChatBox("There is no weapon to get clip ammo of.")
    end
end