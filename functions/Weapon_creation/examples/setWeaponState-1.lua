addEventHandler("onClientResourceStart", resourceRoot,
      function()
            local wep = createWeapon("m4", 0, 0, 4)
            setWeaponState(wep, "firing")
      end
)