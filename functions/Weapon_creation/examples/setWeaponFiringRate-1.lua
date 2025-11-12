addEventHandler("onClientResourceStart", resourceRoot,
function()
   local weapon = createWeapon ("deagle",0,0,10) -- create the weapon (deagle)
   setWeaponAmmo(weapon,5000) -- set weapon ammo to 5000
   setWeaponState(weapon, "firing") -- in firing state.
   setWeaponFiringRate (weapon,2) -- change the weapon firing rate
end
)