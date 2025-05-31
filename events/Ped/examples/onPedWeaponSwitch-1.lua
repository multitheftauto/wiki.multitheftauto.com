function weaponSwitch ( previousWeaponID, currentWeaponID )

outputChatBox("A ped switched weapons from " .. previousWeaponID .. " to " .. currentWeaponID .. "!")

end

addEventHandler ( "onPedWeaponSwitch", getRootElement(), weaponSwitch )