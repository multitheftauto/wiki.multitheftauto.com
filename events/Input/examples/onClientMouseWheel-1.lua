addEventHandler( "onClientMouseWheel", root,
    function ( up_down )
        outputChatBox( "You scrolled mouse wheel " .. ( up_down == 1 and "UP" or "DOWN" ) .. " on " .. getElementType( source ) )
    end
)