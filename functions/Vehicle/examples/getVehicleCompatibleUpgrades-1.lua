function scriptOnPlayerEnterVehicle ( invehicle, seat, jacked )
  local upgrades = getVehicleCompatibleUpgrades ( invehicle )
  for upgradeKey, upgradeValue in ipairs ( upgrades ) do
    outputChatBox ( getVehicleUpgradeSlotName ( upgradeValue ) .. ": " .. upgradeValue )
  end
end
addEventHandler ( "onPlayerVehicleEnter", root, scriptOnPlayerEnterVehicle )