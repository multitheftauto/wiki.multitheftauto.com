addCommandHandler( "getpedsloddistance",
    function( )
        local pedsLODDistance = getPedsLODDistance( )
        outputChatBox( "Your peds LOD distance is at " .. pedsLODDistance )
    end
)