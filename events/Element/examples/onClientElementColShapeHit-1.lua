addEventHandler( "onClientElementColShapeHit", getRootElement( ),
    function ( )
        if ( getElementType( source ) == "player" ) and ( source == getLocalPlayer( ) ) then
            outputChatBox( "You entered colshape" );
        end
    end
);