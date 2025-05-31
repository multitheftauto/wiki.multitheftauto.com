local thePickup = createPickup( 10, 10, 10, 2, 31, 3000, 50 ) -- Create a M4 weapon pickup when the script starts

function pickedUpWeaponCheck( player )
    outputChatBox( "You have picked up a M4.", player ) -- Output a message to the chatbox
end
addEventHandler( "onPickupHit", thePickup, pickedUpWeaponCheck )