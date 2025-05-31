addEventHandler("onClientPedWeaponFire", root,
     function(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
          if isElement(hitElement) and getElementType(hitElement) == "player" then
               outputChatBox("You hit " .. getPlayerName(hitElement), 0, 255, 0)
          end
     end
)