function scriptOnPlayerEnterVehicle ( theVehicle, seat, jacked )
    for i=0, 16 do
        local upgrade = getVehicleUpgradeOnSlot ( theVehicle, i )
        if ( upgrade ) then
            outputChatBox ( getVehicleUpgradeSlotName ( i ) .. ": " .. upgrade)
        end
    end
end
addEventHandler ( "onPlayerVehicleEnter", root, scriptOnPlayerEnterVehicle )