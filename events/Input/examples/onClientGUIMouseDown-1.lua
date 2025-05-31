addEventHandler( "onClientGUIMouseDown", root,
    function ( btn, x, y )
        if btn == "left" then
            clickedElement = source; -- store the clicked element in a global variable
            local elementPos = { guiGetPosition( source, false ) };
            offsetPos = { x - elementPos[ 1 ], y - elementPos[ 2 ] }; -- get the offset position
        end
    end
);

addEventHandler( "onClientGUIMouseUp", root,
    function ( btn, x, y )
        if btn == "left" then
            clickedElement = nil;
        end
    end
);

addEventHandler( "onClientCursorMove", root,
    function ( _, _, x, y )
        if clickedElement then
            guiSetPosition( clickedElement, x - offsetPos[ 1 ], y - offsetPos[ 2 ], false );
        end
    end
);