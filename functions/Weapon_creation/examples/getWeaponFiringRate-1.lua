local weapon = createWeapon("minigun", 0, 0, 3)

function outputMinigunFireRate()
    outputChatBox("Fire rate: " .. getWeaponFiringRate(weapon))
end
addCommandHandler("firerate", outputMinigunFireRate)