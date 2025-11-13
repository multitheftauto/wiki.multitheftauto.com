addCommandHandler( "forwards",
    function( )
        if ( getAnalogControlState( "forwards" ) == 0 ) then
            setAnalogControlState( "forwards", 1 )
        else
            setAnalogControlState( "forwards", 0 )
        end
    end
)