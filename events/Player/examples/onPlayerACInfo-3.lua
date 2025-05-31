-- List of serials which are allowed to use virtual machines
allowVM = { ["0123456789012345601234567890123456"] = true,
            ["A123637892167367281632896790123456"] = true,
            ["E123456789012347839207878392123456"] = true }

function handleOnPlayerACInfo( detectedACList, d3d9Size, d3d9MD5, d3d9SHA256 )
    for _,acCode in ipairs( detectedACList ) do
        if acCode == 14 then
            local serial = getPlayerSerial(source)
            if not allowVM[serial] then
                kickPlayer( source, "This server does not allow virtual machines." )
            end
        end
    end
end
addEventHandler( "onPlayerACInfo", root, handleOnPlayerACInfo )

-- Ensure no one gets missed when the resource is (re)started
addEventHandler( "onResourceStart", resourceRoot,
    function()
        for _,plr in ipairs( getElementsByType("player") ) do
            resendPlayerACInfo( plr )
        end
    end
)