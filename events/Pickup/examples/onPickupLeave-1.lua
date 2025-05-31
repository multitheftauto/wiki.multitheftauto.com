local thePickup = createPickup( 10, 10, 10, 2, 31, 3000, 50 ) -- Create a M4 weapon pickup when the script starts

function leftWeaponPickup( player )
    outputChatBox( "You have left the M4 weapon pickup.", player ) -- Output a message to the chatbox
end
addEventHandler( "onPickupLeave", thePickup, leftWeaponPickup)