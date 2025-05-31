addEventHandler ("onPlayerWeaponFire", root, 
   function (weapon, endX, endY, endZ, hitElement, startX, startY, startZ)
       createExplosion(endX, endY, endZ, 2, source);
   end
)