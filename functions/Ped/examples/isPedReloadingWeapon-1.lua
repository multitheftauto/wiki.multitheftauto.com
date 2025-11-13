function isHeReloading( )
    if isPedReloadingWeapon( localPlayer ) then
        outputChatBox( "You are reloading a weapon" )
    else
        outputChatBox( "No, you're not reloading a weapon" )
    end
end
addCommandHandler( "amireloading", isHeReloading )