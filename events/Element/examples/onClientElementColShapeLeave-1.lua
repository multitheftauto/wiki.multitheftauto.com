addEventHandler( "onClientElementColShapeLeave", getRootElement( ),
    function ( )
        if ( getElementType( source ) == "player" ) and ( source == getLocalPlayer( ) ) then
            outputChatBox( "You left colshape" );
        end
    end
);