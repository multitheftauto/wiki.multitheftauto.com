addEventHandler( "onClientResourceStart", resourceRoot,
    function ( )
        textLabel = guiCreateLabel( 0, .9, 1, .1, "X: -;  Y: -", true );
        guiLabelSetHorizontalAlign( textLabel, "center" );
    end
);

addEventHandler( "onClientCursorMove", root,
    function ( _, _, x, y )
        guiSetText( textLabel, "X: " .. tostring( x ) .. ";  Y: ".. tostring( y ) )
    end
);