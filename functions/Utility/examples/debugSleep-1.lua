addCommandHandler ( "zzz",
    function ( command, sleep )
        if ( sleep ) then
            local ms = tonumber ( sleep )
            if ( ms ) then
                debugSleep ( ms )
            end
        end
    end
)