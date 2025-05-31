addEventHandler( "onClientResourceStop", getRootElement( ),
    function ( stoppedRes )
        outputChatBox( "Resource stopped: " .. getResourceName( stoppedRes ) );
    end
);