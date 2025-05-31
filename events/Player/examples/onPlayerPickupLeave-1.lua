local aPickup = createPickup ( 10.0, 10.0, 10.0, 2, 31, 3000, 50 ) --Create an M4 weapon pickup when script starts

function leftWeaponPickup( pickup )
   if pickup == aPickup then
      outputChatBox ( "You have left the M4 weapon pickup.", source ) --Display this message in the chat box
   end
end
addEventHandler ( "onPlayerPickupLeave", root, pickedUpWeaponCheck )