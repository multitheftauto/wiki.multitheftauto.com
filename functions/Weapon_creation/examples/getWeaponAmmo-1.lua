function createCustomWeapon()
   local position = Vector3(getElementPosition(localPlayer)) -- get the localPlayer position
   local weapon = createWeapon ("m4",position.x,position.y,position.z) -- Create the weapon
     if weapon then -- If the weapon exist then
       setWeaponAmmo(weapon,5000) 
       local ammo = getWeaponAmmo(weapon)  
       outputChatBox("Total ammo: "..ammo) -- output to the chatbox
    end 
end 
addCommandHandler("weapon",createCustomWeapon)