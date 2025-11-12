local weapon = createWeapon("silenced", 0, 0, 10) -- Create the weapon
if weapon then -- if the weapon exist then
   setWeaponFlags(weapon, "instant_reload", true) -- enable instant_reload
   local flag = (getWeaponFlags (weapon,"instant_reload") and "instant_reload enabled") or "instant_reload disabled"
   outputChatBox (flag)
end