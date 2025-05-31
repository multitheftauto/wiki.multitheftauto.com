addEventHandler( "onClientResourceStart", getResourceRootElement( ),
    function ( )
        guiCreateWindow( 10, 200, 200, 150, "TEST WINDOW", false );
        textLabel = guiCreateLabel( 0, .9, 1, .1, "", true );
        guiLabelSetHorizontalAlign( textLabel, "center" );
    end
);

addEventHandler( "onClientMouseMove", getRootElement( ),
    function ( x, y )
        if source then
            if not guiGetVisible( textLabel ) then guiSetVisible( textLabel, true ) end
            guiSetText( textLabel, "X: " .. tostring( x ) .. ";  Y: ".. tostring( y ) )
        else
            guiSetVisible( textLabel, false );
        end
    end
)