local weaponIDs = {1,22,25,28,30,33,35,16,42,10,44,40} -- Weapon IDs

function givePlayerWeapons ( thePlayer, commandName )
   -- Give the player a weapon for each slot
   for i = 1 , #weaponIDs do
      giveWeapon (thePlayer,weaponIDs[i], 1 )
   end
   -- Randomly select which weapon to equip, slots 1 through 12
   setPedWeaponSlot ( thePlayer, math.random ( 1, 12) )
end
addCommandHandler ( "giveweapons", givePlayerWeapons )