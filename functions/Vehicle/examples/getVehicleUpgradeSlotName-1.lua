function scriptOnPlayerEnterVehicle ( theVehicle, seat, jacked )
    local upgrades = getVehicleUpgrades ( theVehicle )
    for _, upgrade in ipairs ( upgrades ) do
        outputChatBox ( getVehicleUpgradeSlotName ( upgrade ) .. ": " .. upgrade )
    end
end
addEventHandler ( "onPlayerVehicleEnter", root, scriptOnPlayerEnterVehicle )