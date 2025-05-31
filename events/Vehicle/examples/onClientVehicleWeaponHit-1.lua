addEventHandler("onClientVehicleWeaponHit", root,
     function(weaponType, hitElement, hitX, hitY, hitZ, model, materialID)
          outputChatBox(tostring(weaponType).." "..tostring(hitElement).." "..tostring(hitX).." "..tostring(hitY).." "..tostring(hitZ).." "..tostring(model).." "..tostring(materialID))
     end
)