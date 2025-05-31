addEventHandler( "onClientResourceStart", getRootElement( ),
    function ( startedRes )
        outputChatBox( "Resource started: " .. getResourceName( startedRes ) );
    end
);