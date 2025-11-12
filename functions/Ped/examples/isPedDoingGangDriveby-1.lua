function setDoingDriveby ( )
        -- we check if local player isn't currently doing a gang driveby
        if not isPedDoingGangDriveby ( localPlayer ) then
                -- if he got driveby mode off, turn it on
                setPedWeaponSlot ( localPlayer, 4 )
                setPedDoingGangDriveby ( localPlayer, true )
        else
                -- otherwise, turn it off
                setPedWeaponSlot ( localPlayer, 0 )
                setPedDoingGangDriveby ( localPlayer, false )
        end
end
addCommandHandler ( "driveby", setDoingDriveby )