function pickupUse( thePlayer )
    outputChatBox( getPlayerName( thePlayer ) .. " used a pickup!" )
end
addEventHandler( "onPickupUse", root, pickupUse )